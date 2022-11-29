import 'package:finalproject_front/pages/sign/join_division_page/join_division_page.dart';
import 'package:finalproject_front/pages/sign/join_page/join_page.dart';
import 'package:finalproject_front/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class UserLogoutMypage extends StatelessWidget {
  const UserLogoutMypage({super.key});

  @override
  Widget build(BuildContext context) {
    final String text;
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage("https://picsum.photos/200"),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          _divider(),
          _textButton(context, "로그인", "/login"),
          _divider(),
          _textButton(context, "회원가입", "/joinDivision"),
          _divider(),
          _textButton(context, "알람 설정", "/join"),
          _divider(),
          _textButton(context, "고객센터", "/join"),
          _divider(),
        ],
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      elevation: 1,
      backgroundColor: Colors.white,
      leading: IconButton(
        onPressed: () {},
        icon: Icon(
          CupertinoIcons.bell,
          color: Colors.black,
        ),
      ),
      centerTitle: true,
      title: TextButton(
        onPressed: () {},
        child: Text(
          "로고",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  Divider _divider() {
    // return Container(
    //     width: double.infinity,
    //     height: 1,
    //     child: ColoredBox(
    //       color: Colors.black,
    //     ));
    return Divider(
      thickness: 1,
      height: 0, // 기본 설정된 패딩 값을 없애줌
      color: Color(0xff929AAB),
    );
  }

  Widget _textButton(context, String text, String path) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Container(
        width: double.infinity,
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, path);
          },
          child: Text(
            "${text}",
            style: TextStyle(color: Colors.black),
          ),
          style: TextButton.styleFrom(alignment: Alignment.bottomLeft),
        ),
      ),
    );
  }
}
