import 'package:akyc_chat/core/constant/color.dart';
import 'package:akyc_chat/ui/pages/chat_list_page/chat_list_page.dart';
import 'package:akyc_chat/ui/pages/friend_list_page/friend_list_page.dart';
import 'package:akyc_chat/ui/pages/my_page/my_page.dart';
import 'package:akyc_chat/utils/custom_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: onWillPop,
        child: IndexedStack(
          index: _selectedPage,
          children: [
            FriendListPage(),
            ChatListPage(),
            MyPage(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedPage,
        selectedItemColor: k00Color,
        unselectedItemColor: kC8Color,
        onTap: (index) {
          setState(() {
            _selectedPage = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: "홈",
            icon: Icon(Icons.menu),
          ),
          BottomNavigationBarItem(
            label: "홈",
            icon: Icon(CupertinoIcons.chat_bubble_2),
          ),
          BottomNavigationBarItem(
            label: "홈",
            icon: Icon(CupertinoIcons.person),
          ),
        ],
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }

  DateTime? currentBackPressTime;

  Future<bool> onWillPop() async {
    DateTime currentTime = DateTime.now();

    if (currentBackPressTime == null ||
        currentTime.difference(currentBackPressTime!) >
            const Duration(seconds: 2)) {
      currentBackPressTime = currentTime;
      customSnackbar(context, "'뒤로' 버튼을 한번 더 누르시면 종료됩니다.");
      return false;
    }
    return true;
  }
}
