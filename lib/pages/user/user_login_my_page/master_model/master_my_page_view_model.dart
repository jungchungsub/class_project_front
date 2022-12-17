import 'package:finalproject_front/domain/user_session.dart';
import 'package:finalproject_front/dto/response/respone_dto.dart';
import 'package:finalproject_front/main.dart';
import 'package:finalproject_front/pages/user/user_login_my_page/master_model/master_my_page_model.dart';
import 'package:finalproject_front/pages/user/user_login_my_page/user_model/user_my_page_model.dart';
import 'package:finalproject_front/service/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../../../../dto/response/master_login_resp_dto.dart';
import '../../../../dto/response/my_page_resp_dto.dart';

/**autoDispose : 재 로그인 시 유저 정보 업데이트 역할을 해줌. */
//  뷰 모델은 전부 StateNotifier로 만들기 -> 상태를 가지고 있고 상태를 변경 할 수있음.
// <ViewModel,Model> ViewModel ->데이터 관리자, Model -> 데이터
final masterMyPageViewModel = StateNotifierProvider.autoDispose<MasterMyPageViewModel, MasterMyPageModel?>((ref) {
  return MasterMyPageViewModel(null, ref)..initViewModel();
});

class MasterMyPageViewModel extends StateNotifier<MasterMyPageModel?> {
  final gContext = navigatorKey.currentContext;
  final UserService userService = UserService();
  MasterMyPageViewModel(super.state, this.ref);
  Ref ref;

  Future<void> initViewModel() async {
    // MyPage에 토큰 인증 필요.
    ResponseDto responseDto = await userService.fetchGetMasterDetailMyPage(UserSession.user!.id);
    if (responseDto.statusCode < 400) {
      state = MasterMyPageModel(responseDto.data);
    } else {
      ScaffoldMessenger.of(gContext!).showSnackBar(
        const SnackBar(content: Text("잘못된 요청입니다.")),
      );
    }
  }

  //1 배열 다시 생성 --> 삭제 , 2. 뷰모델에서 ref.read실행
  // void notifyDelete(int postId) async { 배열에서 id만 지워서 다시 만들어줌.
  //   state = state!.where((e) => e.id != postId).toList();
  // }
  // 뒤로가기 하면서 상태 변경 -> delete
}
