import 'package:finalproject_front/dto/request/profile_update_info.dart';
import 'package:finalproject_front/pages/user/components/profile_update_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../../../dto/request/profile_req_dto.dart';

class UserProfileUpdatePage extends ConsumerWidget {
  // final ProfileDetailRespDto mode;
  ProfileUpdateInfo model;
  ProfileUpdateReqDto profileUpdateReqDto = ProfileUpdateReqDto.single();
  UserProfileUpdatePage({required this.model, super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Logger().d("업데이트 페이지 ${model.career}");
    return Scaffold(
      appBar: _buildAppbar(context),
      body: ProfileUpdateForm(profileUpdateReqDto: profileUpdateReqDto, model: model),
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
