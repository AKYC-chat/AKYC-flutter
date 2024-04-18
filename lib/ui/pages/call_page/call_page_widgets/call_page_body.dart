import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';
import 'package:uuid/uuid.dart';

class CallPageBody extends StatefulWidget {
  const CallPageBody({super.key});

  @override
  State<CallPageBody> createState() => _CallPageBodyState();
}

class _CallPageBodyState extends State<CallPageBody> {
  late StompClient stompClient;

  final config = {
    'iceServers': [
      {
        "url": "stun:stun.l.google.com:19302",
      },
    ],
    'sdpSemantics': 'unified-plan'
  };

  final sdpConstraints = {
    'mandatory': {
      'OfferToReceiveAudio': true,
      'OfferToReceiveVideo': true,
    },
    'optional': []
  };

  String socketUrlSockJS = "https://signal.autoaiapp.kr/signaling";

  final String _myKey = const Uuid().v4();
  String message = '';
  String _roomId = '';
  List<String> otherKeyList = [];
  Map<String, RTCPeerConnection> pcListMap = {};
  final _localRenderer = RTCVideoRenderer();
  final _remoteRenderer = RTCVideoRenderer();
  late MediaStream localStream;

  void onConnect(StompClient stompClient, StompFrame stompFrame) {
    stompClient.subscribe(
      destination: '/topic/peer/iceCandidate/$_myKey/$_roomId',
      callback: (frame) {
        if (frame.body != null) {
          Logger().d("Received iceCandidate");

          try {
            Map<String, dynamic> result = jsonDecode(frame.body!);
            String key = result['key'];
            Map<String, dynamic> body = result['body'];
            String candidate = body['candidate'];
            String sdpMid = body['sdpMid'];
            int sdpMLineIndex = body['sdpMLineIndex'];
            if (key == _myKey) return;
            // 해당 키로부터 받은 ice 등록
            RTCPeerConnection? pc = pcListMap[key];
            if (pc != null) {
              Logger().d("onIceCandidate: $key");
              Logger()
                  .d("onIceCandidate: $candidate , $sdpMid , $sdpMLineIndex");

              RTCIceCandidate candidates = RTCIceCandidate(
                candidate,
                sdpMid,
                sdpMLineIndex,
              );

              pc.addCandidate(candidates);
            }
          } catch (e) {
            Logger().d('/topic/peer/iceCandidate : $e');
          }
        }
      },
    );

    stompClient.subscribe(
        destination: '/topic/peer/offer/$_myKey/$_roomId',
        callback: (frame) async {
          if (frame.body != null) {
            try {
              Map<String, dynamic> result = jsonDecode(frame.body!);
              String key = result['key'];
              Logger().d("Received offer from: $key");
              Map<String, dynamic> body = result['body'];
              String sdp =
                  body['sdp'].replaceAll('setup:actpass', 'setup:active');
              String type = body['type'];
              Logger().d("Set offer: $key");
              // 해당 키와 나와 peerConnection 등록
              // 오퍼를 받는 경우는 상대방이 peerConnection을 등록해서 보냈기 때문
              pcListMap[key] = await createPeer(key);
              // 해당 키와 나와 연결된 peerConnection에 전달 받은 오퍼 등록
              await pcListMap[key]!
                  .setRemoteDescription(RTCSessionDescription(sdp, type));
              pcListMap[key]!.onSignalingState = (state) {
                if (state ==
                    RTCSignalingState.RTCSignalingStateHaveRemoteOffer) {
                  // 해당 키로부터 받은 오퍼를 등록한 후 answer 생성,등록 후 전송
                  sendAnswer(pcListMap[key]!, key);
                }
              };
            } catch (e) {
              Logger().d('/topic/peer/offer : $e');
            }
          }
        });

    stompClient.subscribe(
        destination: '/topic/peer/answer/$_myKey/$_roomId',
        callback: (frame) {
          if (frame.body != null) {
            try {
              Map<String, dynamic> result = jsonDecode(frame.body!);
              String key = result['key'];
              Map<String, dynamic> body = result['body'];
              String sdp = body['sdp'];
              String type = body['type'];
              Logger().d("Received answer: $result");
              RTCPeerConnection? pc = pcListMap[key];
              if (pc != null) {
                pc.setRemoteDescription(RTCSessionDescription(sdp, type));
              }
            } catch (e) {
              Logger().d('/topic/peer/answer : $e');
            }
          }
        });

    stompClient.subscribe(
        destination: '/topic/call/key',
        callback: (frame) {
          stompClient.send(
              destination: '/web/send/key', headers: {}, body: '"$_myKey"');
        });

    stompClient.subscribe(
        destination: '/topic/send/key',
        callback: (frame) async {
          if (frame.body != null) {
            String key = frame.body!.replaceAll('"', '');
            if (key == _myKey) return;
            Logger().d("GET Other key: ${frame.body}");
            if (!pcListMap.containsKey(key)) {
              Logger().d("Create PC for otherKey: $key");
              pcListMap[key] = await createPeer(key);
              sendOffer(pcListMap[key]!, key);
            }
          }
        });
  }

  @override
  void initState() {
    super.initState();
    initRenderers();
    permission();
  }

  void initRenderers() async {
    await _localRenderer.initialize();
    await _remoteRenderer.initialize();
  }

  void permission() async {
// You can request multiple permissions at once.
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
      Permission.storage,
      Permission.camera,
      Permission.microphone
    ].request();
  }

  Future<void> _handleButtonPress() async {
    Logger().d("Send My Key $_myKey");
    if (stompClient.connected) {
      try {
        stompClient.send(
            destination: '/web/call/key', headers: {}, body: '"$_myKey"');
      } catch (e) {
        Logger().e("Error sending message: $e");
      }
    } else {
      Logger().d("Stomp client is not connected.");
    }
  }

  void sendOffer(RTCPeerConnection pc, String otherKey) {
    pc.createOffer().then((offer) {
      Logger().d("Sending offer At: $otherKey");
      String jsonOffer = jsonEncode(offer.toMap());
      String body = '{"key":"$_myKey","body":$jsonOffer}';
      Logger().d("Register Offer At $_myKey");
      setLocalAndSendMessage(pc, offer);
      stompClient.send(
          destination: '/web/peer/offer/$otherKey/$_roomId',
          headers: {},
          body: body);
    });
  }

  void sendAnswer(RTCPeerConnection pc, String otherKey) {
    pc.createAnswer().then((answer) {
      Logger().d("Sending answer At: $otherKey");
      Logger().d("Register answer At $_myKey");
      setLocalAndSendMessage(pc, answer);
      String destination = '/web/peer/answer/$otherKey/$_roomId';
      String jsonAnswer = jsonEncode(answer.toMap());
      String body = '{"key":"$_myKey","body":$jsonAnswer}';
      stompClient.send(destination: destination, headers: {}, body: body);
    });
  }

  void setLocalAndSendMessage(
      RTCPeerConnection pc, RTCSessionDescription sessionDescription) {
    pc.setLocalDescription(sessionDescription);
  }

  Future<RTCPeerConnection> createPeer(String otherKey) async {
    Logger().d("Create Peer: $otherKey");
    RTCPeerConnection pc = await createPeerConnection(config, sdpConstraints);

    pc.onIceCandidate = (ice) {
      if (ice.candidate != null) {
        String jsonIce = jsonEncode(ice.toMap());
        String body = '{"key":"$_myKey","body":$jsonIce}';

        stompClient.send(
            destination: '/web/peer/iceCandidate/$otherKey/$_roomId',
            headers: {},
            body: body);
      }
    };

    pc.onTrack = (event) {
      Logger().d("Get Remote Stream : $event");
      var stream = event.streams;
      _remoteRenderer.srcObject = stream[0];
    };

    pc.onAddStream = (stream) {
      Logger().d(stream);
    };

    localStream.getTracks().forEach((track) {
      pc.addTrack(track, localStream);
    });

    return pc;
  }

  void _handleInputChangeRoomId(String newText) {
    if (newText.isNotEmpty) {
      setState(() {
        _roomId = newText;
      });

      startCam();

      // Configuration client with SockJS.
      stompClient = StompClient(
        config: StompConfig.sockJS(
          url: socketUrlSockJS,
          onConnect: (stompFrame) => onConnect(stompClient, stompFrame),
        ),
      );

      stompClient.activate();
      Logger().d("Stomp Activate");
    }
  }

  void _handleGetPCList() {
    Logger().d("PC List: $pcListMap");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stomp Client Demo"),
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Your message from server:",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(message),
              SizedBox(height: 20),
              TextField(
                onChanged: _handleInputChangeRoomId,
                decoration: const InputDecoration(
                  labelText: 'Enter Room ID',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _handleButtonPress,
                child: Text('Stream'),
              ),
              Text(
                "My Video",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(
                width: 100,
                height: 100,
                child: RTCVideoView(_localRenderer, mirror: true),
              ),
              Text(
                "Other Video",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(
                width: 100,
                height: 100,
                child: RTCVideoView(_remoteRenderer, mirror: true),
              ),
              ElevatedButton(
                onPressed: _handleGetPCList,
                child: Text('GET PC List'),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    stompClient.deactivate();

    _localRenderer.dispose();
    _remoteRenderer.dispose();

    pcListMap.values.forEach((pc) {
      pc.close();
    });
    pcListMap.clear();

    if (localStream != null) {
      localStream.getTracks().forEach((track) {
        track.stop();
      });
      localStream.dispose();
    }

    super.dispose();
  }

  startCam() async {
    try {
      await navigator.mediaDevices
          .getUserMedia({'audio': true, 'video': true}).then((stream) {
        localStream = stream;
        stream.getAudioTracks()[0].enabled = true;
        _localRenderer.srcObject = localStream;
      }).catchError((onError) => Logger().d(onError));
    } catch (e) {
      Logger().d("Error initializing camera: $e");
    }
  }
}
