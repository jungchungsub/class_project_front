import 'package:finalproject_front/dto/response/respone_dto.dart';
import 'package:finalproject_front/pages/lesson/lesson_detail_page/lesson_detail_page.dart';
import 'package:finalproject_front/pages/main/home/home_page/model/home_page_view_model.dart';
import 'package:finalproject_front/service/lesson_service.dart';
import 'package:finalproject_front/dto/response/lesson_resp_dto.dart';
import 'package:finalproject_front/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final lessonController = Provider<LessonController>((ref) {
  // Controller + HttpRepo
  return LessonController(ref);
});

class LessonController {
  final mContext = navigatorKey.currentContext!;
  Ref _ref;
  LessonController(this._ref);
  final LessonService lessonService = LessonService();

// 절대 리턴 하지 말기
  void moveDetailPage(int lessonId) async {
    Logger().d("컨트롤러 실행 확인.");
    //통신요청
    String? jwtToken;
    ResponseDto respDto = await lessonService.getLessonDetail(lessonId, jwtToken); //가져온 값을 RespDto에 저장
    Navigator.popAndPushNamed(mContext, "/lessonDetail");
  }

  Future<void> refreshHomePage() async {
    Logger().d("컨트롤러 실행 확인.");
    _ref.read(homePageViewModel.notifier).notifyViewModel();
  }
}

// void moveDetailPage(int postId) {
//   Navigator.push(mContext, MaterialPageRoute(builder: ((context) => LessonDetailPage(lessonId: lessonId))));
// }
