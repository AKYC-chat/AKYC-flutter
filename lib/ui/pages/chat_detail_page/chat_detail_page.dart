import 'package:akyc_chat/ui/pages/chat_detail_page/chat_detail_page_widgets/chat_detail_page_body.dart';
import 'package:flutter/material.dart';

class ChatDetailPage extends StatelessWidget {
  const ChatDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("누구누구"),
      ),
      body: ChatDetailPageBody(),
    );
  }
}
