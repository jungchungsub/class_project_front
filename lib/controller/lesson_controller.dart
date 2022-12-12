import 'package:finalproject_front/dto/response/respone_dto.dart';
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
  final context = navigatorKey.currentContext!;
  Ref _ref;
  LessonController(this._ref);

// 절대 리턴 하지 말기
  void moveDetailPage(int lessonId) async {
    Logger().d("컨트롤러 실행 확인.");
    //통신요청
    ResponseDto respDto = await LessonService().getLessonDetail(lessonId); //가져온 값을 RespDto에 저장
    Navigator.popAndPushNamed(context!, "/lessonDetail");
    // context!,
    // MaterialPageRoute(
    //   builder: (context) => DetailPage(postId),
    // ),
  }
}
