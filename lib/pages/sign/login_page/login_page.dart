import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/pages/sign/join_page/components/custom_form.dart';
import 'package:finalproject_front/pages/sign/components/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>(); // 글로벌 key
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(children: [
            CustomTextFormField(text: "아이디"),
            SizedBox(height: 6),
            CustomTextFormField(text: "비밀번호"),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _authLogin("assets/kakaologin.png"),
                SizedBox(width: 20),
                _authLogin("assets/applelogin.png"),
              ],
            ),
            SizedBox(height: 16),
            _loginButton(context, "로그인 하기"),
            TextButton(
              onPressed: () {},
              child: Text(
                "아이디, 비밀번호 찾기",
                style: TextStyle(color: gSubTextColor),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  ClipRRect _authLogin(String image) {
    return ClipRRect(
      // ignore: sort_child_properties_last
      child: Image.asset(
        "${image}",
        width: 60,
        height: 60,
      ),
      borderRadius: BorderRadius.circular(30),
    );
  }

  ConstrainedBox _loginButton(BuildContext context, String buttontext) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(height: 50),
      child: TextButton(
        style: TextButton.styleFrom(backgroundColor: gButtonOffColor),
        onPressed: () {
          //id,password validation체크 필요
          if (_formKey.currentState!.validate()) {
            Navigator.pushNamed(context, "/main");
          }
        },
        child: Text(
          "${buttontext}",
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
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
}
