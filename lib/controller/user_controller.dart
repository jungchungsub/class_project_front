// ignore_for_file: use_build_context_synchronously

import 'package:finalproject_front/core/util/move_profile_insert_dialog.dart';
import 'package:finalproject_front/domain/user_session.dart';
import 'package:finalproject_front/dto/request/profile_insert_req_dto.dart';
import 'package:finalproject_front/dto/request/profile_req_dto.dart';
import 'package:finalproject_front/dto/response/respone_dto.dart';
import 'package:finalproject_front/main.dart';
import 'package:finalproject_front/pages/auth/join_page.dart';

import 'package:finalproject_front/pages/lesson/lesson_master_list/lesson_master_list.dart';

import 'package:finalproject_front/pages/user/user_login_my_page/user_model/user_my_page_view_model.dart';
import 'package:finalproject_front/pages/user/user_profile_detail_page/model/user_profile_detail_page_view_model.dart';
import 'package:finalproject_front/pages/user/user_profile_detail_page/user_profile_detail_page.dart';
import 'package:finalproject_front/service/local_service.dart';
import 'package:finalproject_front/service/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

  Future<void> moveLoginPage() async {
    await Navigator.pushNamed(gContext, "/login");
  }

  Future<void> beforeLoginMainPage() async {
    if (UserSession.isLogin == false) {
      await Navigator.pushNamed(gContext, "/main");
    } else {
      ScaffoldMessenger.of(gContext).showSnackBar(
        SnackBar(content: Text("잘못된 요청 입니다.")),
      );
    }
  }

  Future<void> moveJoginDivisionPage() async {
    await Navigator.pushNamed(gContext, "/joinDivision");
  }

  Future<void> moveLoginDivisionPage() async {
    await Navigator.pushNamed(gContext, "/loginDivision");
  }

  Future<void> moveJoinPage(String role) async {
    if (role == "USER") {
      await Navigator.push(gContext, MaterialPageRoute(builder: (context) => JoinPage(role: role)));
    }
    if (role == "EXPERT") {
      await Navigator.push(gContext, MaterialPageRoute(builder: (context) => JoinPage(role: role)));
    }
  }

  Future<void> moveProfileInsertOrDetailPage({required int id, required String username}) async {
    // 프로필이 없다면 프로필 등록 페이지로 이동.
    if (id == 0) {
      moveAlertDialog(gContext, "프로필이 없습니다.", "프로필 등록 페이지로 이동", username);
    } else {
      //프로필이 있다면 아래로 이동
      Navigator.push(
          gContext, MaterialPageRoute(builder: (context) => UserProfileDetailPage(id: UserSession.user.id, username: UserSession.user.username)));
    }
  }

  void moveSellingPage({required int userId}) {
    Navigator.push(gContext, MaterialPageRoute(builder: ((context) => LessonMasterListPage(userId: userId))));
  }

  Future<void> logout() async {
    // 세션 값 삭제
    await UserSession.removeAuthentication();
    await Navigator.pushNamedAndRemoveUntil(gContext, "/logoutMyPage", (route) => false);
  }

  Future<void> deleteUser({required int userId}) async {
    ResponseDto responseDto = await userService.fetchDeleteUser(userId);
    if (responseDto.statusCode < 400) {
      await UserSession.removeAuthentication();
      Navigator.popAndPushNamed(gContext, "/main");
    } else {
      ScaffoldMessenger.of(gContext).showSnackBar(
        SnackBar(content: Text("회원 탈퇴 실패")),
      );
    }
  }

  Future<void> joinUser({required JoinReqDto joinReqDto}) async {
    // Service 호출
    ResponseDto responseDto = await userService.fetchJoin(joinReqDto);
    if (responseDto.statusCode < 400) {
      Navigator.popAndPushNamed(gContext, "/login");
    } else {
      ScaffoldMessenger.of(gContext).showSnackBar(
        SnackBar(content: Text("회원가입 실패")),
      );
    }
  }

  Future<void> loginUser({required LoginReqDto loginReqDto}) async {
    ResponseDto responseDto = await userService.fetchLogin(loginReqDto);
    if (responseDto.statusCode < 400) {
      await LocalService().fetchJwtToken();
      Navigator.of(navigatorKey.currentContext!).pushNamedAndRemoveUntil("/main", (route) => false);
    } else {
      ScaffoldMessenger.of(gContext).showSnackBar(
        const SnackBar(content: Text("로그인 실패")),
      );
    }
  }

  Future<void> updateUser({required int id, required userUpdateReqDto}) async {
    ResponseDto responseDto = await userService.fetchUpdateUser(id, userUpdateReqDto);
    Logger().d("데이터 확인 :${responseDto.msg}");
    if (responseDto.statusCode < 400) {
      //userUpdatePage반영
      LocalService().fetchJwtToken();
      Navigator.pop(gContext);
    } else {
      ScaffoldMessenger.of(gContext).showSnackBar(
        SnackBar(content: Text("게시글 수정 실패 : ${responseDto.msg}")),
      );
    }
  }

  Future<void> updateProfile({required int id, required ProfileUpdateReqDto profileUpdateReqDto}) async {
    ResponseDto responseDto = await userService.fetchUpdateProfile(id, profileUpdateReqDto);
    if (responseDto.statusCode < 400) {
      //이전 페이지가 수정된 데이터로 업데이트
      _ref.read(userProfileDetailPageViewModel(id).notifier).notifyViewModel();
      _ref.read(userMyPageViewModel.notifier).initViewModel();
      LocalService().fetchJwtToken();
      Navigator.pop(gContext);
    }
  }

  Future<void> insertProfile({required int userId, required ProfileInsertReqDto profileInsertReqDto}) async {
    ResponseDto responseDto = await userService.fetchInsertProfile(profileInsertReqDto);
    if (responseDto.statusCode < 400) {
      // MyPage에서 profile의 여부에 따라 사진이 달라지기때문에 초기화
      _ref.read(userMyPageViewModel.notifier).initViewModel();
      _ref.read(userProfileDetailPageViewModel(userId).notifier).notifyViewModel();
      Navigator.pop(gContext);
    } else {
      ScaffoldMessenger.of(gContext).showSnackBar(
        SnackBar(content: Text("프로필 등록 실패")),
      );
    }
  }
}
