import 'package:finalproject_front/domain/user_session.dart';
import 'package:finalproject_front/dto/response/respone_dto.dart';
import 'package:finalproject_front/dto/response/user_resp_dto.dart';
import 'package:finalproject_front/main.dart';
import 'package:finalproject_front/pages/user/user_login_my_page/model/user_login_my_page_model.dart';
import 'package:finalproject_front/service/local_service.dart';
import 'package:finalproject_front/service/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

/**autoDispose : 재 로그인 시 유저 정보 업데이트 역할을 해줌. */

final userLoginMyPageViewModel = StateNotifierProvider.autoDispose<UserLoginMyPageViewModel, UserLoginMyPageModel?>((ref) {
  return UserLoginMyPageViewModel(null)..notifyViewModel();
  //..initViewModel()
});

class UserLoginMyPageViewModel extends StateNotifier<UserLoginMyPageModel?> {
  final gContext = navigatorKey.currentContext;
  final UserService userService = UserService();
  UserLoginMyPageViewModel(super.state);

  Future<void> notifyViewModel() async {
    UserRespDto user = UserSession.user;
    int id = user.id;
    ResponseDto responseDto = await userService.getUserInfoForMyPage(id);
    Logger().d("로거 확인 : ${id}");

    if (responseDto.statusCode > 300) {
      state = UserLoginMyPageModel(responseDto.data);
    } else {
      ScaffoldMessenger.of(gContext!).showSnackBar(
        const SnackBar(content: Text("Jwt 토큰이 만료되었습니다. 로그인 페이지로 이동합니다.")),
      );
    }
    ;
  }
}

  // Future<void> initViewModel() async {
  //   Logger().d("뷰모델 확인 : ${UserSession.isLogin}");
  //   Logger().d("뷰 모델 토큰 확인 :${secureStorage.read(key: "jwtToken").toString()}");
  //   ResponseDto responseDto = await userService.getUserInfoForMyPage(UserSession.user!.id);
  //   if (responseDto.statusCode < 400) {
  //     state = UserLoginMyPageModel(responseDto.data);
  //   } else {
  //     ScaffoldMessenger.of(gContext!).showSnackBar(const SnackBar(content: Text("잘못된 접근입니다.")));
  //   }
  // }

