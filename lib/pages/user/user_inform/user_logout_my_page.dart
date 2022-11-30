import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/pages/sign/join_division_page/join_division_page.dart';
import 'package:finalproject_front/pages/sign/join_page/join_page.dart';
import 'package:finalproject_front/pages/user/user_inform/components/custom_text_button.dart';
import 'package:finalproject_front/pages/user/user_inform/components/image_box.dart';
import 'package:finalproject_front/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class UserLogoutMyPage extends StatelessWidget {
  const UserLogoutMyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final String text;
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ImageBox(),
          ),
          __buildDivider(),
          CustomTextButton(
              context: context, text: "로그인", path: "/loginDivision"),
          __buildDivider(),
          CustomTextButton(
              context: context, text: "회원가입", path: "/joinDivision"),
          __buildDivider(),
          CustomTextButton(context: context, text: "알람 설정", path: "/join"),
          __buildDivider(),
          CustomTextButton(context: context, text: "고객센터", path: "/join"),
          __buildDivider(),
          CustomTextButton(
              context: context,
              text: "Login MyPage (임의 생성)",
              path: "/LoginMypage"),
          __buildDivider(),
        ],
      ),
    );
  }

  Divider __buildDivider() {
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
