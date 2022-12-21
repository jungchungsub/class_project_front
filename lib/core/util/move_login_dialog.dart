import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/size.dart';
import 'package:flutter/material.dart';

class MoveLoginDialog extends StatelessWidget {
  const MoveLoginDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      backgroundColor: gContentBoxColor,
      elevation: 10,
      //Dialog Main Title
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("회원 전용 페이지입니다.", style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "회원가입 또는 로그인을 진행해 주세요.",
          ),
        ],
      ),
      actions: [
        SizedBox(width: gap_l),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              child: const Text(
                "회원가입 하러 가기",
                style: TextStyle(),
              ),
              onPressed: () {
                Navigator.pushNamed(context, "/joinDivision");
              },
            ),
            SizedBox(width: 30),
            TextButton(
              child: const Text(
                "로그인 하러 가기",
                style: TextStyle(),
              ),
              onPressed: () {
                Navigator.pushNamed(context, "/loginDivision");
              },
            ),
          ],
        ),
        SizedBox(width: gap_m),
      ],
    );
  }
}
