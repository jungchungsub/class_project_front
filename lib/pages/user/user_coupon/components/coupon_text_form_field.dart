import 'package:flutter/material.dart';

class CouponTextFormField extends StatelessWidget {
  final String text;
  const CouponTextFormField({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        TextFormField(
          //1. 값이 없으면 plase enter some text 경고 화면 표시
          validator: (value) =>
              value!.isEmpty ? "${text}을 입력해주세요." : null, // 입력된 값은 value에 저장된다.
          // 2. 해당 textformfield가 비밀번호 입력 양식이라면 ***표시 처리 해줌.
          obscureText: text == "Password" ? true : false,
          decoration: InputDecoration(
              hintText: "${text}를 입력해주세요",
              hintStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xff787272),
              ),
              //3. 기본 textFormfield 디자인 - enabledBorder
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffD9D9D9), width: 3.0),
                borderRadius: BorderRadius.circular(10),
              ),
              //4. 터치시 TextFormField디자인 - focusedBorder
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffD9D9D9), width: 3.0),
                borderRadius: BorderRadius.circular(10),
              ),
              //5. 에러 발생시 TextformField디자인 - errorBorder
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffD9D9D9), width: 3.0),
                borderRadius: BorderRadius.circular(10),
              ),
              //6. 에러 발생 후 손가락 터치 디자인  - focusedErrorBorder
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffD9D9D9), width: 3.0),
                borderRadius: BorderRadius.circular(10),
              )),
        ),
      ],
    );
  }
}
