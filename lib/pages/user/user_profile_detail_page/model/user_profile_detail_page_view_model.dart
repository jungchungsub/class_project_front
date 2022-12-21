import 'package:finalproject_front/core/http_connector.dart';
import 'package:finalproject_front/dto/response/profile_resp_dto.dart';
import 'package:finalproject_front/dto/response/respone_dto.dart';
import 'package:finalproject_front/main.dart';
import 'package:finalproject_front/pages/user/user_profile_detail_page/model/user_profile_detail_page_model.dart';
import 'package:finalproject_front/service/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../../../../domain/user_session.dart';

// ! 는 null 불가능 , ?는 null 허용
final userProfileDetailPageViewModel =
    StateNotifierProvider.family.autoDispose<UserProfileDetailPageViewModel, UserProfileDetailPageModel?, int>((ref, userId) {
  return UserProfileDetailPageViewModel(null, ref, userId)..notifyViewModel();
});

class UserProfileDetailPageViewModel extends StateNotifier<UserProfileDetailPageModel?> {
  final UserService userService = UserService();
  final int userId;
  final mContext = navigatorKey.currentContext;
  Ref ref;
  UserProfileDetailPageViewModel(super.state, this.ref, this.userId);

  Future<void> notifyViewModel() async {
    ResponseDto responseDto = await userService.fetchGetDetailProfile(userId);
    if (responseDto.statusCode < 400) {
      state = UserProfileDetailPageModel(responseDto.data);
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        const SnackBar(content: Text("잘못된 요청입니다.")),
      );
    }
  }
}
