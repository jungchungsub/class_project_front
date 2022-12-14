import 'package:finalproject_front/domain/user_session.dart';
import 'package:finalproject_front/dto/response/respone_dto.dart';
import 'package:finalproject_front/main.dart';
import 'package:finalproject_front/pages/sign/join_page.dart';
import 'package:finalproject_front/pages/user/user_profile_detail_page/user_profile_detail_page.dart';
import 'package:finalproject_front/service/local_service.dart';
import 'package:finalproject_front/service/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

import '../dto/request/auth_req_dto.dart';

/**
 * Controller은 비즈니스 로직을 담당
 * 기존 Repository -> Service로 로직 변경, Spring과 거의 똑같은 구조라고 생각하면 됌.
 * 네이밍 규칙 
 * 페이지 이동 -> move
 * 화면 갱신 -> refresh
 * 
 */
final userController = Provider<UserController>((ref) {
  return UserController(ref);
});

class UserController {
  final gContext = navigatorKey.currentContext!;
  final Ref _ref;
  UserController(this._ref);
  final UserService userService = UserService();

  Future<void> moveJoinPage(String role) async {
    if (role == "USER") {
      await Navigator.push(gContext, MaterialPageRoute(builder: (context) => JoinPage(role: role)));
    }
    if (role == "MASTER") {
      await Navigator.push(gContext, MaterialPageRoute(builder: (context) => JoinPage(role: role)));
    }
  }

  Future<void> moveProfileDetailPage(int id) async {
    await Navigator.push(gContext, MaterialPageRoute(builder: (context) => UserProfileDetailPage(id: id)));
  }

  Future<void> logout() async {
    // 세션 값 삭제
    await UserSession.removeAuthentication();
    await Navigator.pushNamedAndRemoveUntil(gContext, "/logoutMyPage", (route) => false);
  }

  Future<void> joinUser(
      {required String username, required String password, required String email, required String phoneNum, required String role}) async {
    // Dto로 변환
    JoinReqDto joinReqDto = JoinReqDto(username: username, password: password, email: email, phoneNum: phoneNum, role: role);

    // Service 호출
    ResponseDto respDto = await userService.fetchJoin(joinReqDto);
    if (respDto.statusCode == 201) {
      Navigator.popAndPushNamed(gContext, "/login");
    } else {
      ScaffoldMessenger.of(gContext).showSnackBar(
        SnackBar(content: Text("회원가입 실패")),
      );
    }
  }

  Future<void> loginUser({required String username, required String password}) async {
    // 1. DTO 변환
    LoginReqDto loginReqDto = LoginReqDto(username: username, password: password);

    // 2. 통신 요청
    ResponseDto respDto = await userService.fetchLogin(loginReqDto);
    //3. 비지니스 로직 처리
    Logger().d("controller status확인 : ${respDto.statusCode}");
    if (respDto.statusCode > 0 || respDto.statusCode < 300) {
      Navigator.of(gContext).popAndPushNamed("/main");
    } else {
      ScaffoldMessenger.of(gContext).showSnackBar(
        const SnackBar(content: Text("로그인 실패")),
      );
    }
  }

  Future<void> updateUser(
      {required int id, required String password, required String email, required String phoneNum, required List<int> categoryIds}) async {
    UpdateUserReqDto updateUserReqDto = UpdateUserReqDto(
      password: password,
      email: email,
      phoneNum: phoneNum,
      categoryIds: categoryIds,
    );

    ResponseDto responseDto = await userService.fetchUpdateUser(id, updateUserReqDto);
    if (responseDto.statusCode < 400) {
      LocalService().fetchJwtToken();
      //userUpdatePage반영
      Navigator.pop(gContext!);
    } else {
      ScaffoldMessenger.of(gContext!).showSnackBar(
        SnackBar(content: Text("게시글 수정 실패 : ${responseDto.msg}")),
      );
    }
  }

  // void delete() {
  //1. 서버에 삭제 요청.
  //   ResponseDto responseDto = ref.read(서비스).fetchdelete();

  //   Navigator.pop(gContext);
  // }
}
