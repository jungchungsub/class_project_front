import 'package:finalproject_front/pages/main/home/home_page.dart';
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
      children: [],
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(label: "홈", icon: Icon(CupertinoIcons.home, color: Colors.lightBlue)),
        BottomNavigationBarItem(label: "검색", icon: Icon(CupertinoIcons.square_on_square, color: Colors.lightBlue)),
        BottomNavigationBarItem(label: "찜", icon: Icon(CupertinoIcons.placemark, color: Colors.lightBlue)),
        BottomNavigationBarItem(label: "채팅", icon: Icon(CupertinoIcons.chat_bubble_2, color: Colors.lightBlue)),
        BottomNavigationBarItem(label: "내정보", icon: Icon(CupertinoIcons.person, color: Colors.lightBlue)),
      ],
    );
  }
}
