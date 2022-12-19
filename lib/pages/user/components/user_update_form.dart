import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/controller/user_controller.dart';
import 'package:finalproject_front/domain/user_session.dart';
import 'package:finalproject_front/dto/request/auth_req_dto.dart';
import 'package:finalproject_front/pages/components/custom_main_button.dart';
import 'package:finalproject_front/pages/auth/components/category_select_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../../../size.dart';

class UserUpdateForm extends ConsumerStatefulWidget {
  UserUpdateForm({required this.userUpdateReqDto, super.key});
  late UserUpdateReqDto userUpdateReqDto;

  @override
  ConsumerState<UserUpdateForm> createState() => _CustomFormState();
}

class _CustomFormState extends ConsumerState<UserUpdateForm> {
  late ScrollController scrollController;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController(text: "${UserSession.user.email}");
  final TextEditingController _phoneNum = TextEditingController(text: "${UserSession.user.phoneNum}");
  final TextEditingController _password = TextEditingController(text: "비밀번호");

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  // final TextEditingController _phoneNumberController = TextEditingController(text: "${UserSession.user.phoneNum}");
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
            _buildTextField(
              fieldTitle: "이메일",
              fieldController: _email,
              scrollAnimate: scrollAnimate,
              hintText: "Email",
              onChanged: (value) {
                widget.userUpdateReqDto.email = value.trim();
              },
            ),
            SizedBox(height: 6),
            _buildTextField(
                fieldTitle: "전화번호",
                fieldController: _phoneNum,
                scrollAnimate: scrollAnimate,
                hintText: "PhoneNumber",
                onChanged: (value) {
                  widget.userUpdateReqDto.phoneNum = value.trim();
                }),
            SizedBox(height: 6),
            _buildTextField(
                fieldTitle: "비밀번호",
                fieldController: _password,
                scrollAnimate: scrollAnimate,
                hintText: "Password",
                onChanged: (value) {
                  widget.userUpdateReqDto.password = value.trim();
                }),
            SizedBox(height: 6),
            Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "관심사 선택",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: gap_m),
                CategorySelectButton(userUpdateReqDto: widget.userUpdateReqDto),
              ],
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Logger().d("버튼 값 확인 ${widget.userUpdateReqDto.password}");
                userCT.updateUser(id: UserSession.user.id, userUpdateReqDto: widget.userUpdateReqDto);
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

  Widget _buildTextField({
    required String fieldTitle,
    required TextEditingController fieldController,
    required Function scrollAnimate,
    String? hintText,
    required ValueChanged<String> onChanged,
  }) {
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
            onChanged: onChanged,
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
      scrollController.animateTo(MediaQuery.of(context).viewInsets.bottom,
          duration: Duration(microseconds: 100), // 0.1초 이후 field가 올라간다.
          curve: Curves.easeIn); //Curves - 올라갈때 애니메이션
    });
  }
}
