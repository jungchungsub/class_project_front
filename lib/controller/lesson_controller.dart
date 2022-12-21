import 'package:finalproject_front/domain/user_session.dart';
import 'package:finalproject_front/dto/request/lesson_req_dto.dart';
import 'package:finalproject_front/dto/response/respone_dto.dart';
import 'package:finalproject_front/pages/category/category_detail_page.dart';
import 'package:finalproject_front/pages/lesson/lesson_detail_page/lesson_detail_page.dart';
import 'package:finalproject_front/pages/lesson/lesson_master_list/model/lesson_master_list_view_model.dart';

import 'package:finalproject_front/pages/main/home/home_page/model/home_page_view_model.dart';
import 'package:finalproject_front/service/lesson_service.dart';
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

  Future<void> refreshHomePage() async {
    Logger().d("컨트롤러 실행 확인.");
    _ref.read(homePageViewModel.notifier).notifyViewModel();
  }

  Future<void> moveDetailPage({required int lessonId}) async {
    Navigator.push(gContext, MaterialPageRoute(builder: ((context) => LessonDetailPage(lessonId: lessonId))));
  }

  Future<void> lessonInsert({required LessonInsertReqDto lessonInsertReqDto}) async {
    ResponseDto responseDto = await lessonService.fetchlessonInsert(lessonInsertReqDto);
    if (responseDto.statusCode < 400) {
      _ref.read(homePageViewModel.notifier).notifyViewModel();
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(gContext).showSnackBar(
        SnackBar(content: Text("레슨 등록 성공")),
      );
    }
  }

  Future<void> moveCategoryPage({required int categoryId}) async {
    Navigator.push(gContext, MaterialPageRoute(builder: ((context) => CategoryDetailPage(categoryId: categoryId))));
  }

  Future<void> updateLesson({required int lessonId, required LessonUpdateReqDto lessonUpdateReqDto}) async {
    ResponseDto responseDto = await lessonService.fetchUpdateLesson(lessonId, lessonUpdateReqDto);
    if (responseDto.statusCode < 400) {
      //이전 페이지가 수정된 데이터로 업데이트
      _ref.read(homePageViewModel.notifier).notifyViewModel();
      _ref.read(lessonMasterListViewModel(UserSession.user.userId).notifier).notifyViewModel();
      Navigator.pop(gContext);
    }
  }
}
