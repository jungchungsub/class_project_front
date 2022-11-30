import 'package:finalproject_front/pages/payment/payment_card/components/advertisement_text.dart';
import 'package:finalproject_front/pages/payment/payment_card/components/card_category.dart';
import 'package:finalproject_front/pages/payment/payment_card/components/card_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PaymentCardPage extends StatelessWidget {
  const PaymentCardPage({Key? key}) : super(key: key);

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
          "결제하기",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Text(
            "신용/체크카드",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          AdvertisementText(Text1: 'BC카드', Text2: '2~7개월 무이자할부'),
          Divider(
            thickness: 1,
            height: 0,
            color: const Color(0xffF0F0F0),
          ),
          AdvertisementText(Text1: '삼성카드', Text2: '2~7개월 무이자할부'),
          Divider(
            thickness: 1,
            height: 0,
            color: const Color(0xffF0F0F0),
          ),
          SizedBox(height: 30),
          CardCategory(path: "/paymentInform"),
          SizedBox(height: 15),
          CardCategory(path: "/paymentInform"),
          SizedBox(height: 15),
          CardCategory(path: "/paymentInform"),
          SizedBox(height: 15),
          CardCategory(path: "/paymentInform"),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
