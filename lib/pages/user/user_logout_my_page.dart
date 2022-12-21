import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/pages/user/components/service_text_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'components/bottom_image_box.dart';

class UserLogoutMyPage extends StatelessWidget {
  const UserLogoutMyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final String text;
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: BottomImageBox(),
            ),
            _buildDivider(),
            _buildServiceText(context, "/loginDivision", "로그인"),
            _buildDivider(),
            _buildServiceText(context, "/joinDivision", "회원가입"),
            _buildDivider(),
            _buildServiceText(context, "/join", "알람 설정"),
            _buildDivider(),
            _buildServiceText(context, "/join", "고객센터"),
            _buildDivider(),
          ],
        ),
      ),
    );
  }

  Divider _buildDivider() {
    return Divider(
      thickness: 1,
      color: gBorderColor,
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 1.0,
      leading: IconButton(
        onPressed: () {},
        icon: Icon(
          CupertinoIcons.bell,
          color: Colors.black,
          size: 26,
        ),
      ),
      centerTitle: true,
      title: TextButton(
        onPressed: () {},
        child: Text(
          "로고",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
    );
  }
}

Widget _buildServiceText(BuildContext context, String routePath, String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
    child: SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, routePath);
        },
        child: Text(
          text,
          style: TextStyle(color: Colors.black),
        ),
        style: TextButton.styleFrom(alignment: Alignment.bottomLeft),
      ),
    ),
  );
}
