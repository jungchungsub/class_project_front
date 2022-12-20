import 'package:finalproject_front/dto/request/lesson_update_req_dto.dart';
import 'package:finalproject_front/dto/response/respone_dto.dart';
import 'package:finalproject_front/pages/category/category_detail_page.dart';
import 'package:finalproject_front/pages/lesson/lesson_detail_page/lesson_detail_page.dart';

import 'package:finalproject_front/pages/lesson/lesson_detail_page/model/lesson_detail_page_view_model.dart';

import 'package:finalproject_front/pages/main/home/home_page/model/home_page_view_model.dart';
import 'package:finalproject_front/service/lesson_service.dart';
import 'package:finalproject_front/dto/response/lesson_resp_dto.dart';
import 'package:finalproject_front/main.dart';
import 'package:finalproject_front/service/local_service.dart';
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

  Future<void> refreshHomePage() async {
    Logger().d("컨트롤러 실행 확인.");
    _ref.read(homePageViewModel.notifier).notifyViewModel();
  }

  Future<void> moveDetailPage({required int lessonId}) async {
    Logger().d("디테일 : ${lessonId}");

    await Navigator.push(gContext, MaterialPageRoute(builder: ((context) => LessonDetailPage(lessonId: lessonId))));
  }

  Future<void> lessonInsert({required LessonUpdateReqDto lessonInsertReqDto}) async {
    ResponseDto responseDto = await lessonService.fetchlessonInsert(lessonInsertReqDto);
  }

  void moveCategoryPage({required int categoryId}) {
    Navigator.push(gContext, MaterialPageRoute(builder: ((context) => CategoryDetailPage(categoryId: categoryId))));
  }

  Future<void> updateLesson({required int lessonId, required LessonUpdateReqDto lessonUpdateReqDto}) async {
    ResponseDto responseDto = await lessonService.fetchUpdateLesson(lessonId, lessonUpdateReqDto);
    if (responseDto.statusCode < 400) {
      _ref.read(lessonDetailPageViewModel(lessonId).notifier).notifyViewModel();
      LocalService().fetchJwtToken();
      Navigator.pop(gContext);
    }
  }
}
