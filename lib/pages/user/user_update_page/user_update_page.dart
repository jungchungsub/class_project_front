import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/controller/user_controller.dart';
import 'package:finalproject_front/domain/user.dart';
import 'package:finalproject_front/domain/user_session.dart';
import 'package:finalproject_front/dto/request/auth_req_dto.dart';
import 'package:finalproject_front/pages/user/components/service_text_button.dart';
import 'package:finalproject_front/pages/user/components/user_update_form.dart';
import 'package:finalproject_front/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../../../dto/response/user_login_resp_dto.dart';

class UserUpdatePage extends ConsumerWidget {
  UserUpdatePage({required this.userInfo, super.key});
  UserUpdateReqDto userUpdateReqDto = UserUpdateReqDto.single();
  final User userInfo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userCT = ref.read(userController);
    return Scaffold(
      appBar: _buildAppbar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            UserUpdateForm(userUpdateReqDto: userUpdateReqDto),
            _buildDivider(),
            ServiceTextButton(context: context, text: "전문가 정보", routePath: "/loginDivision"),
            _buildDivider(),
            ServiceTextButton(context: context, text: "알람 설정", routePath: "/joinDivision"),
            _buildDivider(),
            _buildlogOutButton(userCT),
            _buildDivider(),
            _buildDeleteUserButton(userCT),
            _buildDivider(),
            SizedBox(height: gap_xxl),
          ],
        ),
      ),
    );
  }

  Widget _buildlogOutButton(UserController userCT) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      child: SizedBox(
        width: double.infinity,
        child: TextButton(
          onPressed: () {
            userCT.logout();
          },
          // ignore: sort_child_properties_last
          child: Text(
            "로그아웃",
            style: TextStyle(color: gSubTextColor),
          ),
          style: TextButton.styleFrom(alignment: Alignment.bottomLeft),
        ),
      ),
    );
  }

  Widget _buildDeleteUserButton(UserController userCT) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      child: SizedBox(
        width: double.infinity,
        child: TextButton(
          onPressed: () {
            userCT.deleteUser(userId: UserSession.user.id);
          },
          // ignore: sort_child_properties_last
          child: Text(
            "회원탈퇴",
            style: TextStyle(color: gSubTextColor),
          ),
          style: TextButton.styleFrom(alignment: Alignment.bottomLeft),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      thickness: 1,
      color: gBorderColor,
    );
  }

  AppBar _buildAppbar(BuildContext context) {
    return AppBar(
      elevation: 1,
      centerTitle: true,
      title: Text(
        "계정 설정",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      leading: IconButton(
          icon: Icon(
            CupertinoIcons.back,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          }),
    );
  }
}
