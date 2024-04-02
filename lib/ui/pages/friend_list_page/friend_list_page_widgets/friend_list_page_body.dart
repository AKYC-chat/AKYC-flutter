import 'package:akyc_chat/core/constant/color.dart';
import 'package:akyc_chat/core/constant/move.dart';
import 'package:akyc_chat/core/constant/size.dart';
import 'package:akyc_chat/ui/pages/chat_detail_page/chat_detail_page.dart';
import 'package:akyc_chat/utils/custom_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FriendListPageBody extends StatelessWidget {
  const FriendListPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> friendList = [
      {
        "picUrl": "assets/images/pic/cat.png",
        "name": "CBJ",
        "onoff": "온라인",
      },
      {
        "picUrl": "assets/images/pic/cat.png",
        "name": "AJH",
        "onoff": "오프라인",
      },
      {
        "picUrl": "assets/images/pic/cat.png",
        "name": "YJM",
        "onoff": "오프라인",
      },
      {
        "picUrl": "assets/images/pic/cat.png",
        "name": "KYJ",
        "onoff": "온라인",
      },
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.separated(
        itemCount: friendList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Row(
                        children: [
                          Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.asset(friendList[index]["picUrl"]!),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  friendList[index]["name"]!,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: k00Color,
                                    fontSize: size18,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.circle,
                                      size: size10,
                                      color: friendList[index]["onoff"] == "온라인"
                                          ? Colors.green
                                          : Colors.grey,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      friendList[index]["onoff"]!,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      customInkWellButton(
                        context: context,
                        onTap: () {},
                        height: 0.05,
                        width: double.infinity,
                        radius: 5,
                        color: Colors.red,
                        text: "전화",
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      customInkWellButton(
                        context: context,
                        onTap: () {
                          Navigator.of(context)
                              .popAndPushNamed(Move.chatDetailPage);
                        },
                        height: 0.05,
                        width: double.infinity,
                        radius: 5,
                        color: Colors.green,
                        text: "메세지",
                      ),
                    ],
                  );
                },
              );
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.1,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(friendList[index]["picUrl"]!),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          friendList[index]["name"]!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: k00Color,
                            fontSize: size18,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.circle,
                              size: size10,
                              color: friendList[index]["onoff"] == "온라인"
                                  ? Colors.green
                                  : Colors.grey,
                            ),
                            SizedBox(width: 10),
                            Text(
                              friendList[index]["onoff"]!,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: kC8Color,
            thickness: 1,
          );
        },
      ),
    );
  }
}
