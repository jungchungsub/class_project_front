import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/size.dart';
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
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              CupertinoIcons.back,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.transparent,
          title: Text(
            "아이유",
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Divider(
                        color: Colors.black,
                        thickness: 1.0,
                      ),
                      SizedBox(height: gap_m),
                      Container(
                        width: 300,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "크몽을 통하지 않고",
                                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: " 전문가에게 직접 결제하는 경우 서비스 불이행/ 환불 거부/연결두절 ",
                                style: TextStyle(color: Colors.red, fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: "등의 문제가 발생할 수 있습니다.",
                                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: gap_l),
                      Text(
                        "직접 결제 피해 안내",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      MyChat(
                        text: "안녕하세요 문의할 내용이 있어서 연락드립니다 ",
                        time: "오후 11:40",
                      ),
                      OtherChat(
                        name: "아이유",
                        text: "안녕하세요 ^^ 문의 감사합니다! 배송형은 실제 제품을 배송하여 해당 제품을 사용하실 후기를 받는 것 방문 체험단은 방문 후 서비스를 제공 받아 본 후 포스팅 하는 것 ",
                        time: "오후 11:00",
                      ),
                      OtherChat(
                        name: "아이유",
                        text: "더 궁금하시면 010-6393-7605로 전화주십시오",
                        time: "오후 11:30",
                      ),
                      MyChat(
                        text: "문의 내용 감사합니다.",
                        time: "오후 11:10",
                      ),
                      ...List.generate(chats.length, (index) => chats[index]),
                    ],
                  ),
                ),
              ),
            ),
            Divider(
              color: Colors.black,
              thickness: 1.0,
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
          Text(time, style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: gSubTextColor)),
          SizedBox(width: 5),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                color: Color(0xffF6E58A),
              ),
              child: Text(
                text,
                style: TextStyle(),
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
                    color: gClientColor,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Text(time, style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: gSubTextColor))
        ],
      ),
    );
  }
}
