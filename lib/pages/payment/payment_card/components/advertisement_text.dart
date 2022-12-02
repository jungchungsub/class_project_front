import 'package:flutter/material.dart';

class AdvertisementText extends StatelessWidget {
  final String cardName;
  final String text;

  const AdvertisementText({
    required this.cardName,
    required this.text,
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
}
