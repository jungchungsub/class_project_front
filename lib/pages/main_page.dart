import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/pages/chat/chat_list_page.dart';
import 'package:finalproject_front/pages/main/home/home_page/home_page.dart';

import 'package:finalproject_front/pages/search/search_main_page.dart';
import 'package:finalproject_front/pages/subscribe/subscribe_main_page.dart';
import 'package:finalproject_front/pages/user/user_login_my_page/user_login_my_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildIndexedStack(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  IndexedStack _buildIndexedStack() {
    return IndexedStack(
      index: _selectedIndex, //아이콘클릭시 화면 이동
      children: [
        HomePage(),
        SearchPage(),
        SubscribePage(),
        ChatListPage(),
        UserLoginMyPage(),
      ],
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: gPrimaryColor, //Color(0xff4880ED),
      unselectedItemColor: Colors.black,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(label: "홈", icon: Icon(CupertinoIcons.home)),
        BottomNavigationBarItem(label: "검색", icon: Icon(CupertinoIcons.search)),
        BottomNavigationBarItem(label: "찜", icon: Icon(CupertinoIcons.heart)),
        BottomNavigationBarItem(label: "채팅", icon: Icon(CupertinoIcons.chat_bubble_2)),
        BottomNavigationBarItem(label: "내정보", icon: Icon(CupertinoIcons.person)),
      ],
    );
  }
}
