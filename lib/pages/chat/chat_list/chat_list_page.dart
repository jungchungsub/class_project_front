import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/pages/chat/chat_list/components/chat_card_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ChatListPage extends StatefulWidget {
  const ChatListPage({super.key});

  @override
  State<ChatListPage> createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppber(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(CupertinoIcons.search),
                hintText: "닉네임과 메모로 검색하세요.",
                hintStyle: TextStyle(fontWeight: FontWeight.bold),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: gBorderColor,
                    width: 1,
                  ),
                ),
              ),
            ),
            ChatCardList(name: "아이유", message: "사랑해 충섭아", date: "오후 11:00"),
            ChatCardList(name: "아이유", message: "싫어해 충섭아", date: "오후 11:00"),
            ChatCardList(name: "아이유", message: "충섭이는 바보야", date: "오후 11:00"),
            ChatCardList(name: "아이유", message: "충섭이는 굉장해", date: "오후 11:00"),
            ChatCardList(name: "아이유", message: "충섭아 놀러가자", date: "오후 11:00"),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppber() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1.0,
      leading: Padding(
        padding: const EdgeInsets.only(top: 15, left: 20),
        child: Text(
          "편집",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      title: Text(
        "메시지",
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 15, right: 20),
          child: Text(
            "필터",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
