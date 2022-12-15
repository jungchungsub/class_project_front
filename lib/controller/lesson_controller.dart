import 'package:finalproject_front/dto/request/lesson_req_dto.dart';
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
    Navigator.push(mContext, MaterialPageRoute(builder: ((context) => LessonDetailPage(lessonId: lessonId))));
  }

  Future<void> lessonInsert({
    required int id,
    required String name,
    required String photo,
    required int price,
    required String place,
    required int lessonTime,
    required int lessonCount,
    required String possibleDays,
    required String curriculum,
    required String policy,
    required String deadline,
    required int categoryId,
  }) async {
    LessonInsertReqDto lessonInsertReqDto = LessonInsertReqDto(
        name: name,
        photo: photo,
        price: price,
        place: place,
        lessonTime: lessonTime,
        lessonCount: lessonCount,
        possibleDays: possibleDays,
        curriculum: curriculum,
        policy: policy,
        deadline: deadline,
        categoryId: categoryId);

    ResponseDto responseDto = await lessonService.fetchlessonInsert(id, lessonInsertReqDto);
  }
}
