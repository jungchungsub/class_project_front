import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/controller/user_controller.dart';
import 'package:finalproject_front/domain/user_session.dart';
import 'package:finalproject_front/pages/components/custom_main_button.dart';
import 'package:finalproject_front/pages/sign/components/category_select_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../size.dart';

class CustomForm extends ConsumerStatefulWidget {
  @override
  ConsumerState<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends ConsumerState<CustomForm> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = new ScrollController();
  }

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController(text: "${UserSession.user.email}");
  final TextEditingController _phoneNum = TextEditingController(text: "${UserSession.user.phoneNum}");
  // final TextEditingController _phoneNumberController = TextEditingController(text: "${UserSession.user.phoneNum}");
  final TextEditingController _password = TextEditingController(text: "비밀번호");
  // 나중에 관심사 필요함.

  @override
  Widget build(BuildContext context) {
    final userCT = ref.read(userController);
    return Form(
      key: _formKey, // 해당 키로 Form의 상태를 관리 한다.
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildTextField("이메일", _email, scrollAnimate, "Email"),
            SizedBox(height: 6),
            _buildTextField("전화번호", _phoneNum, scrollAnimate, "PhoneNumber"),
            SizedBox(height: 6),
            _buildTextField("비밀번호", _password, scrollAnimate, "Password"),
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
            SizedBox(height: 50),
            // CustomMainButton(buttonRoutePath: "/loginMyPage", buttonText: "수정완료")

            ElevatedButton(
              onPressed: () {
                userCT.updateUser(
                  id: UserSession.user.id,
                  password: _password.text.trim(),
                  email: _email.text.trim(),
                  phoneNum: _phoneNum.text.trim(),
                  categoryIds: [1, 2, 3],
                );
              },
              style: ElevatedButton.styleFrom(
                primary: gButtonOffColor,
                minimumSize: Size(getScreenWidth(context), 60),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "내 정보 수정 완료",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildTextField(String fieldTitle, TextEditingController fieldController, Function scrollAnimate, String hintText) {
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
            obscureText: hintText == "Password" ? true : false, // 비밀번호 hide옵션
            decoration: InputDecoration(
              hintText: "${hintText}",
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
