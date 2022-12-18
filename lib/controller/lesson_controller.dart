import 'package:finalproject_front/dto/request/lesson_req_dto.dart';
import 'package:finalproject_front/dto/response/respone_dto.dart';
import 'package:finalproject_front/pages/category/category_detail_page.dart';
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
  final gContext = navigatorKey.currentContext!;
  final Ref _ref;
  LessonController(this._ref);
  final LessonService lessonService = LessonService();

// 절대 리턴 하지 말기
  // void moveDetailPage(int lessonId) async {
  //   Logger().d("컨트롤러 실행 확인.");
  //   //통신요청
  //   String? jwtToken;
  //   ResponseDto respDto = await lessonService.getLessonDetail(lessonId, jwtToken); //가져온 값을 RespDto에 저장
  //   Navigator.popAndPushNamed(mContext, "/lessonDetail");
  // }

  Future<void> refreshHomePage() async {
    Logger().d("컨트롤러 실행 확인.");
    _ref.read(homePageViewModel.notifier).notifyViewModel();
  }

  void moveDetailPage({required int lessonId}) {
    Navigator.push(gContext, MaterialPageRoute(builder: ((context) => LessonDetailPage(lessonId: lessonId))));
  }

  Future<void> lessonInsert({required LessonInsertReqDto lessonInsertReqDto}) async {
    ResponseDto responseDto = await lessonService.fetchlessonInsert(lessonInsertReqDto);
  }

  void moveCategoryPage({required int categoryId}) {
    Navigator.push(gContext, MaterialPageRoute(builder: ((context) => CategoryDetailPage(categoryId: categoryId))));
  }
}
