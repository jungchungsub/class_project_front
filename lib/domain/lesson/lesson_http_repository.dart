import 'dart:convert';

import 'package:finalproject_front/domain/http_connector.dart';
import 'package:finalproject_front/dto/response/lesson_resp_dto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

final lessonHttprepository = Provider<LessonHttpRepository>((ref) {
  return LessonHttpRepository(ref);
});

class LessonHttpRepository {
  Ref _ref;
  LessonHttpRepository(this._ref);

  Future<LessonRespDto> getLessonDetail(int id) async {
    Response response = await _ref.read(httpConnector).get("/api/lesson/${id}");
    LessonRespDto lessonRespDto = LessonRespDto.fromJson(jsonDecode(response.body));
    return lessonRespDto;
  }
}
