import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/controller/user_controller.dart';
import 'package:finalproject_front/pages/user/components/service_text_button.dart';
import 'package:finalproject_front/pages/user/components/update_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserUpdatePage extends ConsumerWidget {
  const UserUpdatePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    final userCT = ref.read(userController);
    return Scaffold(
      appBar: _buildAppbar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomForm(),
            _buildDivider(),
            ServiceTextButton(context: context, text: "전문가 정보", routePath: "/loginDivision"),
            _buildDivider(),
            ServiceTextButton(context: context, text: "알람 설정", routePath: "/joinDivision"),
            _buildDivider(),
            ServiceTextButton(
              context: context,
              text: "로그아웃",
              action: userCT.logout(),
            ),
            _buildDivider(),
            ServiceTextButton(context: context, text: "회원 탈퇴", routePath: "/joinDivision"),
            _buildDivider(),
          ],
        ),
      ),
    );
  }

  Divider _buildDivider() {
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
