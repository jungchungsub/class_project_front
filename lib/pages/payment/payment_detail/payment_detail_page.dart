import 'package:finalproject_front/pages/payment/payment_detail/components/class_time.dart';

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
      appBar: _appBar(),
      body: ListView(
        children: [
          _className(),
          Divider(
            thickness: 1,
            height: 0,
            color: const Color(0xff929AAB),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            child: Text(
              "수강시간",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          ClassTime(),
          Divider(
            thickness: 14,
            height: 0,
            color: const Color(0xffF0F0F0),
          ),
        ],
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
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
    );
  }

  Padding _className() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 8, bottom: 20, left: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "유튜브로 홈트하기 - 전세계의 운동 영상을",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text("드록바쌤",
                        style: TextStyle(
                            fontSize: 14,
                            color: const Color(0xff787272),
                            fontWeight: FontWeight.bold)),
                  )
                ],
              ),
              Container(
                height: 70,
                width: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage("https://picsum.photos/200"),
                      fit: BoxFit.cover),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
