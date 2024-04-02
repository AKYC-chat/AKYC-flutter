import 'package:akyc_chat/core/constant/move.dart';
import 'package:akyc_chat/core/constant/theme.dart';
import 'package:akyc_chat/ui/pages/auth/login_or_join_page/login_or_join_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
  ));

  runApp(const Akyc());
}

class Akyc extends StatelessWidget {
  const Akyc({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
            child: child!,
          );
        },
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        routes: getRouters(),
        home: LoginOrJoinPage(),
        theme: theme(),
      ),
    );
  }
}
