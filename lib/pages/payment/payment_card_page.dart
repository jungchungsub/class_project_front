import 'package:finalproject_front/size.dart';
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
      appBar: _buildAppbar(context),
      body: Column(
        children: [
          SizedBox(height: 20),
          Text(
            "신용/체크카드",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          _buildAdvertisementText("BC카드", '2~7개월 무이자할부'),
          _buildDivider(),
          _buildAdvertisementText("삼성카드", '2~7개월 무이자할부'),
          _buildDivider(),
          SizedBox(height: 30),
          _buildCardCategory(context, "/paymentDetail"),
          SizedBox(height: 15),
          _buildCardCategory(context, "/paymentDetail"),
          SizedBox(height: 15),
          _buildCardCategory(context, "/paymentDetail"),
          SizedBox(height: 15),
          _buildCardCategory(context, "/paymentDetail"),
          SizedBox(height: 15),
        ],
      ),
    );
  }

  Row _buildCardCategory(BuildContext context, String imagePath) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          child: _buildCardType("assets/samsung_logo.png", "토스"),
          onTap: () {
            Navigator.pushNamed(context, imagePath);
          },
        ),
        SizedBox(width: gap_m),
        InkWell(
          child: _buildCardType("assets/paybook.png", "페이북"),
          onTap: () {
            Navigator.pushNamed(context, imagePath);
          },
        ),
        SizedBox(width: gap_m),
        InkWell(
          child: _buildCardType("assets/Shinhan.png", "신한"),
          onTap: () {
            Navigator.pushNamed(context, imagePath);
          },
        ),
      ],
    );
  }

  Stack _buildCardType(String logoImage, String logoname) {
    return Stack(
      children: [
        Container(
          height: 90,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Color(0xffF8F8F8)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  "${logoImage}",
                  fit: BoxFit.cover,
                  width: 80,
                ),
                Text(
                  "${logoname}",
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Row _buildAdvertisementText(String cardName, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          "assets/samsung_logo.png",
          fit: BoxFit.cover,
          height: 50,
        ),
        Text(
          "${cardName}",
          style: TextStyle(fontSize: 14),
        ),
        Text(
          "${text}",
          style: TextStyle(fontSize: 14),
        ),
      ],
    );
  }

  Divider _buildDivider() {
    return Divider(
      thickness: 1,
      height: 0,
      color: const Color(0xffF0F0F0),
    );
  }

  AppBar _buildAppbar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1.0,
      leading: IconButton(
          icon: Icon(
            CupertinoIcons.back,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          }),
      title: Text(
        "결제하기",
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
    );
  }
}
