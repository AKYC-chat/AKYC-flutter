import 'package:akyc_chat/core/constant/color.dart';
import 'package:akyc_chat/core/constant/move.dart';
import 'package:akyc_chat/core/constant/size.dart';
import 'package:akyc_chat/utils/custom_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPageBody extends StatefulWidget {
  const MyPageBody({super.key});

  @override
  State<MyPageBody> createState() => _MyPageBodyState();
}

class _MyPageBodyState extends State<MyPageBody> {
  bool basic = true;
  bool infoChange = false;
  bool changePassword = false;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        if (basic)
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Image.asset(
                    "assets/images/pic/cat.png",
                    width: double.infinity,
                    height: MediaQuery.of(context).size.width * 1,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Email",
                          style: TextStyle(
                            color: k00Color,
                            fontSize: size15,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "AKYC@aaa.com",
                          style: TextStyle(
                            color: k00Color,
                            fontSize: size15,
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02),
                        Text(
                          "Nickname",
                          style: TextStyle(
                            color: k00Color,
                            fontSize: size15,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "CBJ",
                          style: TextStyle(
                            color: k00Color,
                            fontSize: size15,
                          ),
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  Column(
                    children: [
                      customInkWellButton(
                        context: context,
                        onTap: () {
                          setState(() {
                            basic = false;
                            infoChange = true;
                          });
                        },
                        height: 0.05,
                        width: double.infinity,
                        radius: 5,
                        color: k00Color,
                        text: "정보 수정하기",
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      customInkWellButton(
                        context: context,
                        onTap: () {
                          setState(() {
                            basic = false;
                            changePassword = true;
                          });
                        },
                        height: 0.05,
                        width: double.infinity,
                        radius: 5,
                        color: k00Color,
                        text: "비밀번호 변경하기",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        if (infoChange)
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Stack(
                    children: [
                      Image.asset(
                        "assets/images/pic/cat.png",
                        width: double.infinity,
                        height: MediaQuery.of(context).size.width * 1,
                        fit: BoxFit.fill,
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: InkWell(
                          onTap: () {},
                          child: Icon(CupertinoIcons.camera, size: 60),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nickname",
                        style: TextStyle(
                          color: k00Color,
                          fontSize: size15,
                        ),
                      ),
                      SizedBox(height: 5),
                      customTextFormField(
                        context: context,
                        obscureText: false,
                        hintText: "",
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Spacer(),
                  Column(
                    children: [
                      customInkWellButton(
                        context: context,
                        onTap: () {
                          setState(() {
                            infoChange = false;
                            basic = true;
                          });
                          customSnackbar(context, "닉네임 변경 완료");
                        },
                        height: 0.05,
                        width: double.infinity,
                        radius: 5,
                        color: k00Color,
                        text: "닉네임 변경하기",
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      customInkWellButton(
                        context: context,
                        onTap: () {
                          setState(() {
                            infoChange = false;
                            basic = true;
                          });
                        },
                        height: 0.05,
                        width: double.infinity,
                        radius: 5,
                        color: k00Color,
                        text: "돌아가기",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        if (changePassword)
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  customTextFormField(
                    context: context,
                    hintText: "비밀번호를 입력해주세요",
                    obscureText: false,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  customTextFormField(
                    context: context,
                    hintText: "변경할 비밀번호를 입력해주세요",
                    obscureText: false,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01),
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
                  Spacer(),
                  customInkWellButton(
                    context: context,
                    onTap: () {
                      setState(() {
                        changePassword = false;
                        basic = true;
                      });
                      customSnackbar(context, "비밀번호 변경 완료");
                    },
                    height: 0.05,
                    width: double.infinity,
                    radius: 5,
                    color: k00Color,
                    text: "비밀번호 변경하기",
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
