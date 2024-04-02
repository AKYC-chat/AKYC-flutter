import 'package:akyc_chat/core/constant/color.dart';
import 'package:akyc_chat/core/constant/move.dart';
import 'package:akyc_chat/utils/custom_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginOrJoinPageBody extends StatelessWidget {
  const LoginOrJoinPageBody({super.key});

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
                Image.asset(
                  "assets/images/logo/logo2.png",
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.width * 0.6,
                ),
                Column(
                  children: [
                    customInkWellButton(
                      context: context,
                      onTap: () {
                        Navigator.of(context).pushNamed(Move.loginPage);
                      },
                      height: 0.075,
                      width: double.infinity,
                      radius: 5,
                      color: k00Color,
                      text: "Login",
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    customInkWellButton(
                      context: context,
                      onTap: () {
                        Navigator.of(context).pushNamed(Move.joinPage);
                      },
                      height: 0.075,
                      width: double.infinity,
                      radius: 5,
                      color: k00Color,
                      text: "Join",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
