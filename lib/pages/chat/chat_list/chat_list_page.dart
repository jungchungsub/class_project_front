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
  final List<ChatCardList> items = [
    ChatCardList(name: "아이유", message: "충섭아 놀러가자", date: "오후 11:00"),
    ChatCardList(name: "아이유", message: "충섭아 사랑해", date: "오후 11:00"),
    ChatCardList(name: "아이유", message: "충섭아 미안해", date: "오후 11:00"),
    ChatCardList(name: "아이유", message: "충섭아 짜증나", date: "오후 11:00"),
    ChatCardList(name: "아이유", message: "충섭아 연락하지마", date: "오후 11:00"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) => Dismissible(
          // 익명함수
          direction: DismissDirection.endToStart, // 한쪽 방향만 가능
          background: Container(
              color: Colors.red,
              child: Icon(
                Icons.delete_forever,
                color: Colors.white,
                size: 40,
              )),
          key: ValueKey(index.toString()),
          child: items[index],
          // onDismissed: (direction) { // 상태관리에 필요함.
          //   setState(() {
          //     items.removeAt(index);
          //   });
          // },
        ),
      ),
    );
  }

  AppBar _buildAppbar() {
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
      bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: TextFormField(
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
          )),
    );
  }
}
