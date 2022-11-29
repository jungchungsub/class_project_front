import 'package:finalproject_front/pages/payment/payment_card/components/card_type.dart';
import 'package:flutter/cupertino.dart';
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
          _advertisementText(Text1: 'BC카드', Text2: '2~7개월 무이자할부'),
          _divider(),
          _advertisementText(Text1: '삼성카드', Text2: '2~7개월 무이자할부'),
          _divider(),
          SizedBox(height: 30),
          _cardCategory(context, "/paymentInform"),
          SizedBox(height: 15),
          _cardCategory(context, "/paymentInform"),
          SizedBox(height: 15),
          _cardCategory(context, "/paymentInform"),
          SizedBox(height: 15),
          _cardCategory(context, "/paymentInform"),
          SizedBox(height: 15),
        ],
      ),
    );
  }

  Row _cardCategory(context, String path) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          child: CardType(
            logoname: "토스1",
            logoImage: "assets/samsung_logo.png",
          ),
          onTap: () {
            Navigator.pushNamed(context, path);
          },
        ),
        SizedBox(width: 10),
        InkWell(
          child: CardType(
            logoname: "페이북",
            logoImage: "assets/paybook.png",
          ),
          onTap: () {
            Navigator.pushNamed(context, path);
          },
        ),
        SizedBox(width: 10),
        InkWell(
          child: CardType(
            logoname: "신한",
            logoImage: "assets/Shinhan.png",
          ),
          onTap: () {
            Navigator.pushNamed(context, path);
          },
        ),
      ],
    );
  }
}

class _divider extends StatelessWidget {
  const _divider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1,
      height: 0,
      color: const Color(0xffF0F0F0),
    );
  }
}

class _advertisementText extends StatelessWidget {
  final String Text1;
  final String Text2;

  const _advertisementText({
    required this.Text1,
    required this.Text2,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          "assets/samsung_logo.png",
          fit: BoxFit.cover,
          height: 50,
        ),
        Text(
          "${Text1}",
          style: TextStyle(fontSize: 14),
        ),
        Text(
          "${Text2}",
          style: TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
