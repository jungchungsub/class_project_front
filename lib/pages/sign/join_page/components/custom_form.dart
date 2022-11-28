import 'package:finalproject_front/pages/main/home/home_page.dart';
import 'package:finalproject_front/pages/sign/join_page/components/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class CustomForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>(); // 글로벌 key

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey, // 해당 키로 Form의 상태를 관리 한다.
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            CustomTextFormField(text: "아이디"),
            SizedBox(height: 6),
            CustomTextFormField(text: "비밀번호"),
            SizedBox(height: 6),
            CustomTextFormField(text: "이메일"),
            SizedBox(height: 6),
            CustomTextFormField(text: "관심사"),
            SizedBox(height: 50),
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(height: 50),
              child: TextButton(
                style: TextButton.styleFrom(backgroundColor: Color(0xff4880ED)),
                onPressed: () {
                  //Form에서 현재의 상태 값이 null이 아니라면 /home로 push 해준다.
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  }
                },
                child: Text(
                  "회원가입 완료",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
