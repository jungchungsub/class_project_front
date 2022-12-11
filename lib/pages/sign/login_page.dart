import 'package:finalproject_front/pages/components/custom_main_button.dart';
import 'package:finalproject_front/pages/components/custom_text_field.dart';
import 'package:finalproject_front/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  late ScrollController scrollController; // ScrollerController은 non-null이다, late를 선언해 나중에 초기화.

  @override
  void initState() {
    super.initState();
    scrollController = new ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(gap_l),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextField(scrollAnimate, fieldTitle: "아이디", hint: "아이디를 입력해주세요.", lines: 1),
                SizedBox(height: gap_l),
                CustomTextField(scrollAnimate, fieldTitle: "비밀번호", hint: "비밀번호를 입력해주세요.", lines: 1),
                SizedBox(height: gap_l),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildOauthLogin("assets/kakaologin.png"),
                    SizedBox(width: gap_l),
                    _buildOauthLogin("assets/applelogin.png"),
                  ],
                ),
                SizedBox(height: gap_l),
                CustomMainButton(buttonRoutePath: "/main", buttonText: "로그인"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ClipRRect _buildOauthLogin(String imagePath) {
    return ClipRRect(
      // ignore: sort_child_properties_last
      child: Image.asset(
        "${imagePath}",
        width: 60,
        height: 60,
      ),
      borderRadius: BorderRadius.circular(30),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 1,
      centerTitle: true,
      title: Text(
        "로그인",
        style: TextStyle(color: Colors.black),
      ),
      leading: IconButton(
          icon: Icon(
            CupertinoIcons.xmark,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          }),
    );
  }

  void scrollAnimate() {
    Future.delayed(Duration(milliseconds: 600), () {
      scrollController.animateTo(MediaQuery.of(context).viewInsets.bottom,
          duration: Duration(microseconds: 100), // 0.1초 이후 field가 올라간다.
          curve: Curves.easeIn); //Curves - 올라갈때 애니메이션
    });
  }
}
