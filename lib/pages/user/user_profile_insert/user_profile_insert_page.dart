import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/pages/sign/components/custom_text_form_field.dart';
import 'package:finalproject_front/pages/user/user_detail/components/image_box.dart';
import 'package:finalproject_front/pages/user/user_profile_insert/components/career_select_button.dart';
import 'package:finalproject_front/pages/user/user_profile_insert/components/profile_education.dart';
import 'package:finalproject_front/pages/user/user_profile_insert/components/profile_id.dart';
import 'package:finalproject_front/pages/user/user_profile_insert/components/profile_intro.dart';
import 'package:finalproject_front/pages/user/user_profile_insert/components/profile_place.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserProfileInsertPage extends StatelessWidget {
  const UserProfileInsertPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _buildAppbar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileImage(imagePath: "assets/picture.jpg"),
              ProfileId(),
              SizedBox(height: 20),
              ProfileIntro(),
              SizedBox(height: 20),
              ProfilePlace(),
              SizedBox(height: 20),
              ProfileEducation(),
              SizedBox(height: 20),
              ProfileCareer(),
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
        "프로필 등록/수정",
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

class ProfileImage extends StatelessWidget {
  final String? imagePath;
  const ProfileImage({
    this.imagePath,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(150),
      child: Image.asset(
        "${imagePath}",
        width: 80,
        height: 80,
        fit: BoxFit.cover,
      ),
    );
  }
}
