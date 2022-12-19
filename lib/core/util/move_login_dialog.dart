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
            "로그인 페이지로 이동",
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
                //현재 페이지를 스택에서 제거 후 이동 , 그냥 이동하면 alert창이 띄워져있음
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
                //현재 페이지를 스택에서 제거 후 이동 , 그냥 이동하면 alert창이 띄워져있음
                Navigator.pushNamed(context, "/login");
              },
            ),
          ],
        ),
        SizedBox(width: gap_m),
      ],
    );
  }
}
