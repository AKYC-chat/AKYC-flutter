import 'package:akyc_chat/core/constant/color.dart';
import 'package:akyc_chat/core/constant/move.dart';
import 'package:akyc_chat/core/constant/size.dart';
import 'package:akyc_chat/utils/custom_util.dart';
import 'package:flutter/material.dart';

class JoinPageBody extends StatefulWidget {
  const JoinPageBody({super.key});

  @override
  State<JoinPageBody> createState() => _JoinPageBodyState();
}

class _JoinPageBodyState extends State<JoinPageBody> {
  bool auth = true;
  bool nickname = false;
  bool password = false;
  bool success = false;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        if (auth)
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Row(
                        children: [
                          Expanded(
                            child: customTextFormField(
                              obscureText: false,
                              context: context,
                              hintText: "이메일을 입력해 주세요.",
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.2,
                            height: MediaQuery.of(context).size.height * 0.07,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: k00Color,
                            ),
                            child: InkWell(
                              onTap: () {},
                              child: Center(
                                child: Text(
                                  "인증",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
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
                      setState(() {
                        auth = false;
                        nickname = true;
                      });
                    },
                    height: 0.075,
                    width: double.infinity,
                    radius: 5,
                    color: k00Color,
                    text: "NEXT",
                  ),
                ],
              ),
            ),
          ),
        if (nickname)
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  customTextFormField(
                    obscureText: false,
                    context: context,
                    hintText: "닉네임을 입력해 주세요.",
                  ),
                  customInkWellButton(
                    context: context,
                    onTap: () {
                      setState(() {
                        auth = false;
                        nickname = false;
                        password = true;
                      });
                    },
                    height: 0.075,
                    width: double.infinity,
                    radius: 5,
                    color: k00Color,
                    text: "NEXT",
                  ),
                ],
              ),
            ),
          ),
        if (password)
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: [
                      customTextFormField(
                        obscureText: false,
                        context: context,
                        hintText: "비밀번호를 입력해 주세요.",
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      customTextFormField(
                        obscureText: false,
                        context: context,
                        hintText: "비밀번호를 재입력해 주세요.",
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          children: [
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01),
                            Text(
                              "비밀번호가 일치하지 않습니다.",
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: size13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  customInkWellButton(
                    context: context,
                    onTap: () {
                      setState(() {
                        auth = false;
                        nickname = false;
                        password = false;
                        success = true;
                      });
                    },
                    height: 0.075,
                    width: double.infinity,
                    radius: 5,
                    color: k00Color,
                    text: "NEXT",
                  ),
                ],
              ),
            ),
          ),
        if (success)
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
                      Text(
                        "회원가입 완료",
                        style: TextStyle(
                            color: k00Color,
                            fontSize: size20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.08),
                      Text(
                        "AKYC@aaa.com",
                        style: TextStyle(
                            color: k00Color,
                            fontSize: size20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  customInkWellButton(
                    context: context,
                    onTap: () {
                      Navigator.of(context).popAndPushNamed(Move.loginPage);
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
