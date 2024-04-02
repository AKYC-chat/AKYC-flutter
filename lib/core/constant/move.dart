import 'package:akyc_chat/ui/pages/auth/join_page/join_page.dart';
import 'package:akyc_chat/ui/pages/auth/login_or_join_page/login_or_join_page.dart';
import 'package:akyc_chat/ui/pages/auth/login_page/login_page.dart';
import 'package:akyc_chat/ui/pages/chat_detail_page/chat_detail_page.dart';
import 'package:flutter/material.dart';

class Move {
  static String loginOrJoinPage = "/loginOrJoinPage";

  //로그인&가입 페이지
  static String loginPage = "/loginPage";
  static String joinPage = "/joinPage";

  //채팅상세보기
  static String chatDetailPage = "/chatDetailPage";
}

Map<String, Widget Function(BuildContext)> getRouters() {
  return {
    Move.loginOrJoinPage: (context) => LoginOrJoinPage(),

    //로그인&가입 페이지
    Move.loginPage: (context) => LoginPage(),
    Move.joinPage: (context) => JoinPage(),

    //채팅상세보기
    Move.chatDetailPage: (context) => ChatDetailPage(),
  };
}
