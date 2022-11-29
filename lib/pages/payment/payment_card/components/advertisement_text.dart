import 'package:flutter/material.dart';

class AdvertisementText extends StatelessWidget {
  final String Text1;
  final String Text2;

  const AdvertisementText({
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
