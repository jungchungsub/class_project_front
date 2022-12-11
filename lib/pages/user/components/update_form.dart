import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/pages/components/custom_main_button.dart';
import 'package:finalproject_front/pages/sign/components/category_select_button.dart';
import 'package:flutter/material.dart';

import '../../../size.dart';

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

  // 글로벌 keys
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController(text: "green1234@naver.com");
  // DB에 저장되어 있는 값을 가져오는 역할.
  final TextEditingController _phoneNumberController = TextEditingController(text: "01012345678");

  final TextEditingController _passwordController = TextEditingController(text: "비밀번호 자리야 충섭아 뻐큐머겅");

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey, // 해당 키로 Form의 상태를 관리 한다.
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildTextField("이메일", _emailController, scrollAnimate),
            SizedBox(height: 6),
            _buildTextField("전화번호", _phoneNumberController, scrollAnimate),
            SizedBox(height: 6),
            _buildTextField("비밀번호", _passwordController, scrollAnimate),
            SizedBox(height: 6),
            Container(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "관심사 선택",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: gap_m),
                  CategorySelectButton(),
                ],
              ),
            ),
            //개인 정보 제공 동의 폼 필요 -> API
            SizedBox(height: 50),
            CustomMainButton(buttonRoutePath: "/loginMyPage", buttonText: "수정완료")
          ],
        ),
      ),
    );
  }

  Container _buildTextField(String fieldTitle, TextEditingController fieldController, Function scrollAnimate) {
    return Container(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "${fieldTitle}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            onTap: (() {
              scrollAnimate;
            }),
            //validator: , 유효성 체크 부분
            controller: fieldController,
            //obscureText: true, // 비밀번호 hide옵션
            decoration: InputDecoration(
              //3. 기본 textFormfield 디자인 - enabledBorder
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: gClientColor, width: 3.0),
                borderRadius: BorderRadius.circular(10),
              ),
              //마우스 올리고 난 후 스타일
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: gClientColor, width: 3.0),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
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
