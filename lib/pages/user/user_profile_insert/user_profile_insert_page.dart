import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/pages/sign/components/custom_text_form_field.dart';
import 'package:finalproject_front/pages/user/user_detail/components/image_box.dart';
import 'package:finalproject_front/pages/user/user_profile_insert/components/career_select_button.dart';
import 'package:finalproject_front/pages/user/user_profile_insert/components/profile_career_list.dart';
import 'package:finalproject_front/pages/user/user_profile_insert/components/profile_certificate.dart';
import 'package:finalproject_front/pages/user/user_profile_insert/components/profile_education.dart';
import 'package:finalproject_front/pages/user/user_profile_insert/components/profile_id.dart';
import 'package:finalproject_front/pages/user/user_profile_insert/components/profile_image.dart';
import 'package:finalproject_front/pages/user/user_profile_insert/components/profile_insert_button.dart';
import 'package:finalproject_front/pages/user/user_profile_insert/components/profile_intro.dart';
import 'package:finalproject_front/pages/user/user_profile_insert/components/profile_place.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserProfileInsertPage extends StatefulWidget {
  const UserProfileInsertPage({super.key});

  @override
  State<UserProfileInsertPage> createState() => _UserProfileInsertPageState();
}

class _UserProfileInsertPageState extends State<UserProfileInsertPage> {
  late ScrollController scrollController; // ScrollerController은 non-null이다, late를 선언해 나중에 초기화.

  @override
  void initState() {
    super.initState();
    scrollController = new ScrollController();
  }

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
              SizedBox(height: 20),
              ProfileId(),
              SizedBox(height: 20),
              ProfileIntro(scrollAnimate),
              SizedBox(height: 20),
              ProfilePlace(scrollAnimate),
              SizedBox(height: 20),
              ProfileEducation(scrollAnimate),
              SizedBox(height: 20),
              ProfileCertificate(scrollAnimate),
              SizedBox(height: 20),
              ProfileCareer(),
              SizedBox(height: 20),
              ProfileCareerList(scrollAnimate),
              SizedBox(height: 20),
              ProfileInsertButton()
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

  void scrollAnimate() {
    Future.delayed(Duration(milliseconds: 600), () {
      //0.6초 이후 키보드 올라옴
      // ViewInsets은 현재 페이지에서 내가 컨트롤 할 수 없는 영역을 뜻함,
      // bottom은 키보드가 아래에서 올라오기 때문
      scrollController.animateTo(MediaQuery.of(context).viewInsets.bottom,
          duration: Duration(microseconds: 100), // 0.1초 이후 field가 올라간다.
          curve: Curves.easeIn); //Curves - 올라갈때 애니메이션
    });
  }
}
