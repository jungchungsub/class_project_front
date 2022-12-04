import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/pages/components/ArachachaButton.dart';
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
              _buildProfileHeader(
                context,
                "아이유",
                "assets/picture.jpg",
              ),
              SizedBox(height: 20),
              _buildProfileIntro(context,
                  "자기소개 작성하는 공간 충섭아 컨벤션이 너무 어려워 나 좀 살려줘 머리가 터질거같애 할수있어할수있어할수있어할수있어할수있어할수있어할수있어할수있어할수있어할수있어할수있어할수있어할수있어할수있어할수있어할수있어할수있어할수있어할수있어"),
              SizedBox(height: 10),
              _buildProfileContent(context, "지역", "부산"),
              SizedBox(height: 10),
              _buildProfileContent(context, "학력전공", "컴퓨터공학과"),
              SizedBox(height: 10),
              _buildProfileContent(context, "보유자격증", "개인정보취급사"),
              SizedBox(height: 10),
              _buildProfileContent(context, "경력기간", "신입"),
              SizedBox(height: 20),
              ArachachaButton(buttonRoutePath: "/profileInsert", buttonText: "프로필 등록/수정하기")
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context, String name, String profileImagePath) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${name}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(CupertinoIcons.star_fill, color: Colors.yellow, size: 16),
                    SizedBox(width: 10),
                    Text(
                      "4.5 | 25개의 평가",
                      style: TextStyle(color: gSubTextColor, fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(150),
            child: Image.asset(
              profileImagePath,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          )
        ],
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

Widget _buildProfileIntro(BuildContext context, String introContent) {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "소개",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 10),
        _buildUnderLine(),
        SizedBox(height: 10),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "${introContent}",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: gSubTextColor),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  );
}

Container _buildUnderLine() {
  return Container(
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(1),
    ),
    width: 30,
    height: 3,
  );
}

Widget _buildProfileContent(BuildContext context, String title, String content) {
  return Container(
    child: Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "${title}",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 5),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "${content}",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: gSubTextColor),
          ),
        ),
      ],
    ),
  );
}
