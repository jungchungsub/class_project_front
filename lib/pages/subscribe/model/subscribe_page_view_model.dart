import 'package:finalproject_front/domain/user_session.dart';
import 'package:finalproject_front/dto/response/respone_dto.dart';
import 'package:finalproject_front/main.dart';
import 'package:finalproject_front/pages/main/home/home_page/model/home_page_model.dart';
import 'package:finalproject_front/pages/subscribe/model/subscribe_page_model.dart';
import 'package:finalproject_front/service/subscribe_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final subscribePageViewModel = StateNotifierProvider.family.autoDispose<SubscribePageViewModel, SubscribePageModel?, int>((ref, userId) {
  return SubscribePageViewModel(null, userId)..notifyViewModel();
});

class SubscribePageViewModel extends StateNotifier<SubscribePageModel?> {
  final SubscribeService subscribeService = SubscribeService();

  final int userId;
  final mContext = navigatorKey.currentContext;
  SubscribePageViewModel(super.state, this.userId);

  Future<void> notifyViewModel() async {
    String? jwtToken;
    ResponseDto responseDto = await subscribeService.subscribeList(userId, UserSession.jwtToken);
    if (responseDto.statusCode < 300) {
      SubscribePageModel model = SubscribePageModel(responseDto.data);

      state = model;
    } else {
      // 토큰이 만료됨은 로컬 서비스에서 사용하는 코드임 -> 널일 경우 따로 띄워줘야함.
      ScaffoldMessenger.of(mContext!).showSnackBar(
        const SnackBar(content: Text("토큰이 만료되었습니다")),
      );
    }
  }
}
