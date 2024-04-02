import 'package:akyc_chat/ui/pages/auth/login_or_join_page/login_or_join_page_widgets/login_or_join_page_body.dart';
import 'package:flutter/material.dart';

class LoginOrJoinPage extends StatelessWidget {
  const LoginOrJoinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: LoginOrJoinPageBody(),
    );
  }
}
