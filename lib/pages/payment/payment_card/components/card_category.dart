import 'package:finalproject_front/pages/payment/payment_card/components/card_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CardCategory extends StatelessWidget {
  final String path;
  const CardCategory({required this.path, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
