import 'package:finalproject_front/controller/user_controller.dart';
import 'package:finalproject_front/dto/request/auth_req_dto.dart';
import 'package:finalproject_front/pages/sign/components/category_select_button.dart';
import 'package:finalproject_front/pages/components/custom_text_field.dart';
import 'package:finalproject_front/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../../../constants.dart';
import '../../components/custom_main_button.dart';

class JoinCustomForm extends ConsumerWidget {
  JoinCustomForm(this.scrollAnimate, {required this.role, super.key});
  final _id = TextEditingController();
  final _password = TextEditingController();
  final _email = TextEditingController();
  final _phoneNum = TextEditingController();
  final role;
  final Function scrollAnimate;
  final _formKey = GlobalKey<FormState>(); // 글로벌 key

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uc = ref.read(userController);

    return Form(
      key: _formKey, // 해당 키로 Form의 상태를 관리 한다.
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(
                scrollAnimate,
                fieldTitle: "아이디",
                hint: "아이디를 입력해주세요",
                lines: 1,
                fieldController: _id,
              ),
              SizedBox(height: gap_m),
              CustomTextField(
                scrollAnimate,
                fieldTitle: "비밀번호",
                hint: "비밀번호를 입력해주세요",
                lines: 1,
                fieldController: _password,
              ),
              SizedBox(height: gap_m),
              CustomTextField(
                scrollAnimate,
                fieldTitle: "이메일",
                hint: "이메일를 입력해주세요",
                lines: 1,
                fieldController: _email,
              ),
              SizedBox(height: gap_m),
              CustomTextField(
                scrollAnimate,
                fieldTitle: "휴대폰번호",
                hint: "휴대폰번호를 입력해주세요",
                lines: 1,
                fieldController: _phoneNum,
              ),
              SizedBox(height: gap_m),
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
                    CategorySelectButton()
                  ],
                ),
              ),
              //개인 정보 제공 동의 폼 필요 -> API
              SizedBox(height: gap_xl),
              ElevatedButton(
                onPressed: () {
                  uc.joinUser(
                      username: _id.text.trim(),
                      password: _password.text.trim(),
                      email: _email.text.trim(),
                      phoneNum: _phoneNum.text.trim(),
                      role: role);
                },
                style: ElevatedButton.styleFrom(
                  primary: gButtonOffColor,
                  minimumSize: Size(getScreenWidth(context), 60),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "회원가입 완료",
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
      ),
    );
  }
}
