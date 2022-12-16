import 'package:finalproject_front/controller/user_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../dto/request/profile_insert_req_dto.dart';
import '../components/profile_Insert_form.dart';

class UserProfileInsertPage extends ConsumerWidget {
  UserProfileInsertPage({required this.username, super.key});
  ProfileInsertReqDto profileInsertReqDto = ProfileInsertReqDto.single();

  String username;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userCT = ref.read(userController);
    return Scaffold(
      appBar: _buildAppbar(context),
      body: ProfileInsertForm(
        profileInsertReqDto: profileInsertReqDto,
        username: username,
      ),
    );
  }
}

AppBar _buildAppbar(BuildContext context) {
  return AppBar(
    elevation: 1,
    centerTitle: true,
    title: Text(
      "프로필 등록",
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
