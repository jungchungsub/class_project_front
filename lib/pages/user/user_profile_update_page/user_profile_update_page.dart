import 'package:finalproject_front/controller/user_controller.dart';
import 'package:finalproject_front/dto/request/profile_req_dto.dart';
import 'package:finalproject_front/dto/response/profile_resp_dto.dart';
import 'package:finalproject_front/pages/user/components/profile_update_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserProfileUpdatePage extends ConsumerWidget {
  final ProfileRespDto model;
  ProfileUpdateReqDto profileUpdateReqDto = ProfileUpdateReqDto.single();
  UserProfileUpdatePage({required this.model, super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: ProfileUpdateForm(
        model: model,
        profileUpdateReqDto: profileUpdateReqDto,
      ),
    );
  }
}

AppBar _buildAppbar(BuildContext context) {
  return AppBar(
    elevation: 1,
    centerTitle: true,
    title: Text(
      "프로필 수정",
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
