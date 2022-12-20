import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/domain/user_session.dart';
import 'package:finalproject_front/pages/chat/chat_list_page.dart';
import 'package:finalproject_front/pages/main/home/home_page/home_page.dart';

import 'package:finalproject_front/pages/search/searchList.dart';

import 'package:finalproject_front/pages/search/search_main_page.dart';
import 'package:finalproject_front/pages/subscribe/subscribe_page.dart';
import 'package:finalproject_front/pages/user/user_login_my_page/master_login_my_page.dart';
import 'package:finalproject_front/pages/user/user_login_my_page/user_login_my_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../core/util/move_login_dialog.dart';

class MainPage extends StatefulWidget {
  static String role = UserSession.user.role;
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  List loadedPages = [0];

  @override
  Widget build(BuildContext context) {
    Logger().d("mainPage 실행됨");
    return Scaffold(
        body: _buildIndexedStack(),
        // bottomNavigationBar: _buildBottomNavigationBar(),
        bottomNavigationBar: _buildBottomNavigationBar(onTap: (index) {
          var pages = loadedPages;
          if (!pages.contains(index)) {
            pages.add(index);
          }
          setState(() {
            _selectedIndex = index;
            loadedPages = pages;
          });
        }));
  }

  Widget _buildIndexedStack() {
    // 전문가 일경우
    if (UserSession.isLogin == true && UserSession.user.role == '전문가') {
      return IndexedStack(
        index: _selectedIndex, //아이콘클릭시 화면 이동
        children: [
          HomePage(),
          loadedPages.contains(1) ? SearchListPage() : Container(),
          loadedPages.contains(2) ? SubscribePage(userId: UserSession.user.id) : Container(),
          loadedPages.contains(3) ? ChatListPage() : Container(),
          loadedPages.contains(4) ? MasterLoginMyPage() : Container(),
        ],
      );
    }
    // 일반 회원일 경우
    else if (UserSession.isLogin == true && UserSession.user.role == "일반회원") {
      return IndexedStack(
        index: _selectedIndex, //아이콘클릭시 화면 이동
        children: [
          HomePage(),
          loadedPages.contains(1) ? SearchListPage() : Container(),
          loadedPages.contains(2) ? SubscribePage(userId: UserSession.user.id) : Container(),
          loadedPages.contains(3) ? ChatListPage() : Container(),
          loadedPages.contains(4) ? UserLoginMyPage() : Container(),
        ],
      );
    } else if (UserSession.isLogin == false) {
      // 비 로그인시

      {
        return IndexedStack(
          index: _selectedIndex, //아이콘클릭시 화면 이동
          children: [
            HomePage(),
            loadedPages.contains(1) ? MoveLoginDialog() : Center(child: Text("잘못된 요청입니다.")),
            loadedPages.contains(2) ? MoveLoginDialog() : Center(child: Text("잘못된 요청입니다.")),
            loadedPages.contains(3) ? MoveLoginDialog() : Center(child: Text("잘못된 요청입니다.")),
            loadedPages.contains(4) ? MoveLoginDialog() : Center(child: Text("잘못된 요청입니다.")),
          ],
        );
      }
    } else {
      return Container();
    }
  }

  BottomNavigationBar _buildBottomNavigationBar({required ValueChanged onTap}) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: gPrimaryColor, //Color(0xff4880ED),
      unselectedItemColor: Colors.black,

      onTap: onTap,
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
