import 'package:finalproject_front/constants.dart';

import 'package:finalproject_front/pages/main/home/home_page.dart';
import 'package:finalproject_front/pages/payment/payment_detail/components/email_text_form_field.dart';
import 'package:flutter/material.dart';

import 'user_email_text_field.dart';
import 'user_password_text_field.dart';
import 'user_phone_number_text_field.dart';

class CustomForm extends StatefulWidget {
  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  late ScrollController scrollController; // ScrollerController은 non-null이다, late를 선언해 나중에 초기화.

  @override
  void initState() {
    super.initState();
    scrollController = new ScrollController();
  }

  final _formKey = GlobalKey<FormState>();
  // 글로벌 key
  TextEditingController _emailController = TextEditingController(text: "green1234@naver.com");
  // DB에 저장되어 있는 값을 가져오는 역할.
  TextEditingController _phoneNumberController = TextEditingController(text: "01012345678");

  TextEditingController _passwordController = TextEditingController(text: "비밀번호 자리야 충섭아 뻐큐머겅");

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey, // 해당 키로 Form의 상태를 관리 한다.
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            //CustomTextFormField(text: "이메일"),
            UserEmailTextField(emailController: _emailController, scrollAnimate),
            SizedBox(height: 6),
            //CustomTextFormField(text: "연락처"),
            UserPhoneNumberTextField(phoneNumberController: _phoneNumberController, scrollAnimate),
            SizedBox(height: 6),
            UserPasswordTextField(passwordController: _passwordController, scrollAnimate),
            //CustomTextFormField(text: "비밀번호"),
            SizedBox(height: 6),
            //개인 정보 제공 동의 폼 필요 -> API
            SizedBox(height: 50),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/loginMyPage");
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: gButtonOffColor,
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "수정완료",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
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
