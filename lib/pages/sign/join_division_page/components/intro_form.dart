import 'package:finalproject_front/constants.dart';
import 'package:flutter/material.dart';

class IntroForm extends StatelessWidget {
  const IntroForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("어떤 서비스를 이용하고 싶으신가요?", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Text(
          "원하는 회원가입 유형을 선택하세요.\n의뢰인으로 가입 후에도 전문가 등록이 가능합니다.",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: gSubTextColor,
          ),
        ),
      ],
    );
  }
}
