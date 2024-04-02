import 'package:akyc_chat/ui/pages/chat_list_page/chat_list_page_widgets/chat_list_page_body.dart';
import 'package:flutter/material.dart';

class ChatListPage extends StatelessWidget {
  const ChatListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChatListPageBody(),
    );
  }
}
