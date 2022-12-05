import 'dart:ffi';

import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/pages/components/custom_main_button.dart';

import 'package:finalproject_front/pages/components/custom_text_field.dart';
import 'package:finalproject_front/pages/main/home/home_page.dart';
import 'package:finalproject_front/pages/sign/components/category_select_button.dart';
import 'package:finalproject_front/pages/sign/components/join_category_period.dart';
import 'package:finalproject_front/pages/sign/components/join_category_select_button.dart';
import 'package:finalproject_front/pages/user/components/profile_career_select_button.dart';
import 'package:finalproject_front/size.dart';
import 'package:flutter/material.dart';

class JoinCustomForm extends StatelessWidget {
  final Function scrollAnimate;
  final _formKey = GlobalKey<FormState>(); // 글로벌 key
  JoinCustomForm(this.scrollAnimate, {super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey, // 해당 키로 Form의 상태를 관리 한다.
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            CustomTextField(scrollAnimate,
                fieldTitle: "아이디", hint: "아이디를 입력해주세요", lines: 1),
            SizedBox(height: gap_m),
            CustomTextField(scrollAnimate,
                fieldTitle: "비밀번호", hint: "비밀번호를 입력해주세요", lines: 1),
            SizedBox(height: gap_m),
            CustomTextField(scrollAnimate,
                fieldTitle: "이메일", hint: "이메일를 입력해주세요", lines: 1),
            SizedBox(height: gap_m),
            Container(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "관심사 선택",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: gap_m),
                  CategorySelectButton(),
                ],
              ),
            ),
            //개인 정보 제공 동의 폼 필요 -> API
            SizedBox(height: gap_xl),
            CustomMainButton(buttonRoutePath: "/main", buttonText: "회원가입 완료")
          ],
        ),
      ),
    );
  }
}
