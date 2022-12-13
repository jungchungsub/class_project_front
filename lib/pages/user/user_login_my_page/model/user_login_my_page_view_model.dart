import 'package:finalproject_front/domain/user_session.dart';
import 'package:finalproject_front/dto/response/my_page_resp_dto.dart';
import 'package:finalproject_front/dto/response/respone_dto.dart';
import 'package:finalproject_front/main.dart';
import 'package:finalproject_front/pages/user/user_login_my_page/model/user_login_my_page_model.dart';
import 'package:finalproject_front/service/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

/**autoDispose : 재 로그인 시 유저 정보 업데이트 역할을 해줌. */

final userLoginMyPageViewModel = StateNotifierProvider.autoDispose<UserLoginMyPageViewModel, UserLoginMyPageModel?>((ref) {
  return UserLoginMyPageViewModel(null)..initViewModel();
  //..initViewModel()
});

class UserLoginMyPageViewModel extends StateNotifier<UserLoginMyPageModel?> {
  final gContext = navigatorKey.currentContext;
  final UserService userService = UserService();
  UserLoginMyPageViewModel(super.state);

  Future<void> initViewModel() async {
    // MyPage에 토큰 인증 필요.
    Logger().d("재로그인 시 실행됌?");
    ResponseDto responseDto = await userService.getUserInfoForMyPage(UserSession.user!.id, UserSession.jwtToken);
    // 타입 맞춰주기 위해 fromJson
    MyPageRespDto modelData = MyPageRespDto.fromJson(responseDto.data);
    if (modelData.role == "USER") {
      modelData.role = "의뢰인";
    }
    if (modelData.role == "MASTER") {
      modelData.role = "전문가";
    }
    if (responseDto.statusCode < 400) {
      state = UserLoginMyPageModel(modelData);
    } else {
      ScaffoldMessenger.of(gContext!).showSnackBar(
        const SnackBar(content: Text("잘못된 요청입니다.")),
      );
    }
  }
}
