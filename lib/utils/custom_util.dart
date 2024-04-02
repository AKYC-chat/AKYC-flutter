import 'package:akyc_chat/core/constant/color.dart';
import 'package:akyc_chat/core/constant/size.dart';
import 'package:flutter/material.dart';

void customDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          content: Text(message),
        ),
      );
    },
  );
}

void customSnackbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Container(
        child: Center(
          child: Text(
            message,
            style: TextStyle(fontSize: size15),
          ),
        ),
      ),
      duration: Duration(seconds: 1),
      margin: EdgeInsets.only(
        // bottom: MediaQuery.of(context).size.height * 0.05,
        bottom: 0,
        left: 16,
        right: 16,
      ),
      behavior: SnackBarBehavior.floating,
    ),
  );
}

Widget customInkWellButton({
  required BuildContext context,
  required VoidCallback onTap,
  required double height,
  required double width,
  required double radius,
  required Color color,
  required String text,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: MediaQuery.of(context).size.height * height,
      width: MediaQuery.of(context).size.width * width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: color,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: size15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}

//
Widget customTextFormField({
  required BuildContext context,
  required String hintText,
  required bool obscureText,
  TextEditingController? controller,
}) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.07,
    child: TextFormField(
      obscureText: obscureText,
      controller: controller,
      style: TextStyle(decorationThickness: 0),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: "${hintText}",
        hintStyle: TextStyle(
          color: kC8Color,
          fontSize: size15,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: k00Color),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kC8Color),
        ),
      ),
    ),
  );
}
