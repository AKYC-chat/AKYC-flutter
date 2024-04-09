import 'package:akyc_chat/core/constant/move.dart';
import 'package:akyc_chat/ui/pages/chat_detail_page/chat_detail_page_widgets/chat_detail_page_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatDetailPage extends StatelessWidget {
  const ChatDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("누구누구"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(Move.callPage);
                  },
                  child: Icon(CupertinoIcons.phone),
                ),
                // SizedBox(width: 10),
                // InkWell(onTap: () {}, child: Icon(CupertinoIcons.camera)),
              ],
            ),
          ),
        ],
      ),
      body: ChatDetailPageBody(),
    );
  }
}
