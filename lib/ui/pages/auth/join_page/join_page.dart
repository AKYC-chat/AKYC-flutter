import 'package:akyc_chat/ui/pages/auth/join_page/join_page_widgets/join_page_body.dart';
import 'package:flutter/material.dart';

class JoinPage extends StatelessWidget {
  const JoinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JOIN"),
      ),
      body: JoinPageBody(),
    );
  }
}
