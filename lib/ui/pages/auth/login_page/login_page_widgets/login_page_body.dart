import 'package:akyc_chat/core/constant/color.dart';
import 'package:akyc_chat/core/constant/move.dart';
import 'package:akyc_chat/core/constant/size.dart';
import 'package:akyc_chat/ui/pages/main_page.dart';
import 'package:akyc_chat/utils/custom_util.dart';
import 'package:flutter/material.dart';

class LoginPageBody extends StatelessWidget {
  const LoginPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    customTextFormField(
                      obscureText: false,
                      context: context,
                      hintText: "이메일을 입력해 주세요.",
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    customTextFormField(
                      obscureText: true,
                      context: context,
                      hintText: "비밀번호를 입력해 주세요.",
                    ),
                  ],
                ),
                customInkWellButton(
                  context: context,
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => MainPage(),
                        ),
                        (route) => false);
                  },
                  height: 0.075,
                  width: double.infinity,
                  radius: 5,
                  color: k00Color,
                  text: "LOGIN",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
