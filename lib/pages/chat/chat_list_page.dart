import 'package:finalproject_front/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'components/chat_card.dart';

class ChatListPage extends StatefulWidget {
  const ChatListPage({super.key});

  @override
  State<ChatListPage> createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  final List<ChatCard> items = [
    ChatCard(name: "정수영", message: "충섭아 놀러가자", date: "오후 11:00"),
    ChatCard(name: "그린아카데미", message: "정충섭씨 출결 체크 확인 부탁드려요", date: "오후 7:01"),
    ChatCard(name: "정충섭", message: "충섭아...미안해...", date: "오전 11:10"),
    ChatCard(name: "이현성", message: "충섭아 ....어디야....?", date: "오전 08:52"),
    ChatCard(name: "조현나", message: "충섭아 기능 완료 됬는지 확인좀 해줘", date: "오후 11:23"),
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
          key: Key('item ${items[index]}'),
          child: items[index],

          confirmDismiss: (DismissDirection direction) async {
            return await showDialog(
                context: context,
                builder: ((context) {
                  return AlertDialog(
                    title: Text("정말 삭제를 하시겠습니까?"),
                    content: Text("삭제하면 채팅방의 모든 내용은 삭제 됩니다."),
                    actions: <Widget>[
                      TextButton(onPressed: () => Navigator.of(context).pop(true), child: const Text("Delete")),
                      SizedBox(width: 10),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: const Text("Cancel"),
                      ),
                    ],
                  );
                }));
          },
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
                  color: gClientColor,
                  width: 1,
                ),
              ),
            ),
          )),
    );
  }
}
