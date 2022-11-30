import 'package:flutter/material.dart';

const gPrimaryColor = Color(0xFF4880ED);
const gContentBoxColor = Color(0xFFEAF2FD);
const gBorderColor = Color(0xFFD9D9D9);
const gButtonOffColor = Color(0xFF4880ED);
const gButtonOnColor = Color(0xFF4464A1);
const gSubTextColor = Color(0xFF787272);

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1,
      height: 0, // 기본 설정된 패딩 값을 없애줌
      color: gBorderColor,
    );
  }
}
