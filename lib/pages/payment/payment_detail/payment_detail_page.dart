import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:extended_image/extended_image.dart';

class paymentDetailPage extends StatefulWidget {
  const paymentDetailPage({Key? key}) : super(key: key);

  @override
  State<paymentDetailPage> createState() => _paymentDetailPageState();
}

class _paymentDetailPageState extends State<paymentDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        leading: Icon(
          CupertinoIcons.back,
          color: Colors.black,
        ),
        title: Text(
          "주문하기",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text("유튜브로 홈트하기 - 전세계의 운동 영상을 "),
                  Text(
                    "드록바쌤",
                  )
                ],
              ),
              Container(
                height: 70,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage("https://picsum.photos/200"),
                      fit: BoxFit.cover),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
