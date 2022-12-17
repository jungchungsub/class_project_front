import 'package:finalproject_front/pages/user/user_profile_insert_page/user_profile_insert_page.dart';
import 'package:finalproject_front/size.dart';
import 'package:flutter/material.dart';

moveAlertDialog(BuildContext context, String title, String content, String username) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          //Dialog Main Title
          title: Column(
            children: [
              Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Text(
                  content,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: const Text("취소"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(width: gap_l),
            TextButton(
              child: const Text("확인"),
              onPressed: () {
                //현재 페이지를 스택에서 제거 후 이동 , 그냥 이동하면 alert창이 띄워져있음
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => UserProfileInsertPage(username: username)));
              },
            ),
            SizedBox(width: gap_m),
          ],
        );
      });
}
