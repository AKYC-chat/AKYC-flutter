import 'package:akyc_chat/core/constant/color.dart';
import 'package:akyc_chat/core/constant/size.dart';
import 'package:flutter/material.dart';

MaterialColor primaryWhite = MaterialColor(
  0xFFFFFFFF,
  <int, Color>{
    50: Color(0xFFFFFFFF),
    100: Color(0xFFFFFFFF),
    200: Color(0xFFFFFFFF),
    300: Color(0xFFFFFFFF),
    400: Color(0xFFFFFFFF),
    500: Color(0xFFFFFFFF),
    600: Color(0xFFFFFFFF),
    700: Color(0xFFFFFFFF),
    800: Color(0xFFFFFFFF),
    900: Color(0xFFFFFFFF),
  },
);

ThemeData theme() {
  return ThemeData(
    appBarTheme: appBarTheme(),
    primarySwatch: primaryWhite,
    scaffoldBackgroundColor: primaryWhite,
    textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.black),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    titleTextStyle: TextStyle(
      color: k00Color,
      fontSize: size20,
      fontWeight: FontWeight.bold,
    ),
    centerTitle: true,
    elevation: 0,
  );
}
