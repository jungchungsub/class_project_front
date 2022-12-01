import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/pages/user/user_profile_detail/components/profile_detail.dart';
import 'package:finalproject_front/pages/user/user_profile_detail/components/profile_header.dart';
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
              ProfileDetail(),
              SizedBox(height: 20),
              _buildProfileInsertButton(context),
            ],
          ),
        ),
      ),
    );
  }

  InkWell _buildProfileInsertButton(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/profileInsert");
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: gButtonOffColor,
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            "프로필 등록/수정하기",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
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
