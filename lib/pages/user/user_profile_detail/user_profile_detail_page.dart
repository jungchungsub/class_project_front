import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/pages/user/user_profile_detail/components/profile_detail.dart';
import 'package:finalproject_front/pages/user/user_profile_detail/components/profile_header.dart';
import 'package:finalproject_front/pages/user/user_profile_detail/components/profile_content.dart';
import 'package:finalproject_front/pages/user/user_profile_detail/components/profile_header.dart';
import 'package:finalproject_front/pages/user/user_profile_detail/components/profile_update_button.dart';
import 'package:finalproject_front/pages/user/user_profile_detail/components/profile_intro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class UserProfileDetailPage extends StatelessWidget {
  const UserProfileDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              ProfileHeader(),
              SizedBox(height: 20),
              ProfileIntro(
                  introContent:
                      "자기소개 작성하는 공간 충섭아 컨벤션이 너무 어려워 나 좀 살려줘 머리가 터질거같애 할수있어할수있어할수있어할수있어할수있어할수있어할수있어할수있어할수있어할수있어할수있어할수있어할수있어할수있어할수있어할수있어할수있어할수있어할수있어"),
              SizedBox(height: 10),
              ProfileContent(title: "지역", content: "부산"),
              SizedBox(height: 10),
              ProfileContent(title: "학력전공", content: "컴퓨터공학과"),
              SizedBox(height: 10),
              ProfileContent(title: "보유자격증", content: "개인정보취급사"),
              SizedBox(height: 10),
              ProfileContent(title: "경력기간", content: "신입"),
              SizedBox(height: 20),
              ProfileUpdateButton(),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppbar(BuildContext context) {
    return AppBar(
      elevation: 1,
      centerTitle: true,
      title: Text(
        "프로필",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      leading: IconButton(
          icon: Icon(
            CupertinoIcons.back,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          }),
    );
  }
}
