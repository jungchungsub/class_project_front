import 'package:finalproject_front/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class ChatRoomPage extends StatefulWidget {
  @override
  _ChatRoomPageState createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends State<ChatRoomPage> {
  final List<MyChat> chats = [];
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: gPrimaryColor,
      child: Scaffold(
        backgroundColor: gBorderColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            "아이유",
            style: Theme.of(context).textTheme.headline6,
          ),
          actions: [
            Icon(CupertinoIcons.search, size: 20),
            SizedBox(width: 25),
            Icon(CupertinoIcons.bars, size: 20),
            SizedBox(width: 25),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      TimeLine(time: "2022년 12월 16일 금요일"),
                      OtherChat(
                        name: "아이유",
                        text: "현성아 우리 그만 만나자..",
                        time: "오후 11:00",
                      ),
                      MyChat(
                        text: "미안해 잘못했어.",
                        time: "오후 11:10",
                      ),
                      OtherChat(
                        name: "아이유",
                        text: "꺼져 제발",
                        time: "오후 11:30",
                      ),
                      MyChat(
                        text: "오케이",
                        time: "오후 11:40",
                      ),
                      ...List.generate(chats.length, (index) => chats[index]),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 60,
              color: Colors.white,
              child: Row(
                children: [
                  ChatIconButton(icon: Icon(CupertinoIcons.add_circled)),
                  Expanded(
                    child: Container(
                      child: TextField(
                        controller: _textController, // 1
                        maxLines: 1,
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                        ),
                        onSubmitted: _handleSubmitted, // 2
                      ),
                    ),
                  ),
                  ChatIconButton(icon: Icon(CupertinoIcons.smiley)),
                  ChatIconButton(icon: Icon(CupertinoIcons.gear)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSubmitted(text) {
    _textController.clear(); // 1

    setState(() {
      // 2
      chats.add(
        MyChat(
          text: text,
          time: DateFormat("a K:m") // 3
              .format(new DateTime.now())
              .replaceAll("AM", "오전")
              .replaceAll("PM", "오후"),
        ),
      );
    });
  }
}

class ChatIconButton extends StatelessWidget {
  const ChatIconButton({
    Key? key,
    required this.icon,
  }) : super(key: key);
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.symmetric(horizontal: 15),
      icon: icon,
      iconSize: 25,
      onPressed: () {},
    );
  }
}

class MyChat extends StatelessWidget {
  const MyChat({
    Key? key,
    required this.text,
    required this.time,
  }) : super(key: key);

  final String text;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(time, style: TextStyle(fontSize: 12)),
          SizedBox(width: 5),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                color: gPrimaryColor,
              ),
              child: Text(
                text,
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TimeLine extends StatelessWidget {
  final String time;

  const TimeLine({Key? key, required this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFF9cafbe),
      ),
      child: Text(
        time,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class OtherChat extends StatelessWidget {
  const OtherChat({
    Key? key,
    required this.name,
    required this.text,
    required this.time,
  }) : super(key: key);

  final String name;
  final String text;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/picture.jpg'))),
          ),
          SizedBox(width: 10),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name),
                Container(
                  child: Text(text),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Text(time, style: TextStyle(fontSize: 12))
        ],
      ),
    );
  }
}
