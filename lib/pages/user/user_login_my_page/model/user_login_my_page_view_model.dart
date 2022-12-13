import 'package:finalproject_front/domain/user_session.dart';
import 'package:finalproject_front/dto/response/respone_dto.dart';
import 'package:finalproject_front/main.dart';
import 'package:finalproject_front/pages/user/user_login_my_page/model/user_login_my_page_model.dart';
import 'package:finalproject_front/service/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/**autoDispose : 재 로그인 시 유저 정보 업데이트 역할을 해줌. */
//  뷰 모델은 전부 StateNotifier로 만들기 -> 상태를 가지고 있고 상태를 변경 할 수있음.
// <ViewModel,Model> ViewModel ->데이터 관리자, Model -> 데이터
final userLoginMyPageViewModel = StateNotifierProvider.autoDispose<UserLoginMyPageViewModel, UserLoginMyPageModel?>((ref) {
  return UserLoginMyPageViewModel(null, ref)..notifyinitViewModel();
});

class UserLoginMyPageViewModel extends StateNotifier<UserLoginMyPageModel?> {
  final gContext = navigatorKey.currentContext;
  final UserService userService = UserService();
  UserLoginMyPageViewModel(super.state, this.ref);
  Ref ref;

  Future<void> notifyinitViewModel() async {
    // MyPage에 토큰 인증 필요.
    ResponseDto responseDto = await userService.getUserInfoForMyPage(UserSession.user!.id, UserSession.jwtToken);
    if (responseDto.statusCode < 400) {
      state = UserLoginMyPageModel(responseDto.data);
    } else {
      ScaffoldMessenger.of(gContext!).showSnackBar(
        const SnackBar(content: Text("[내 정보 보기 페이지] : 잘못된 요청입니다.")),
      );
    }
  }

  //1 배열 다시 생성 --> 삭제 , 2. 뷰모델에서 ref.read실행
  // void notifyDelete(int postId) async { 배열에서 id만 지워서 다시 만들어줌.
  //   state = state!.where((e) => e.id != postId).toList();
  // }
  // 뒤로가기 하면서 상태 변경 -> delete
}
