import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CardType extends StatelessWidget {
  final String logoname;
  final String logoImage;

  const CardType({required this.logoname, required this.logoImage, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 90,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xffF8F8F8)),
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
}
