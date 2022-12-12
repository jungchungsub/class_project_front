import 'dart:convert';

import 'package:finalproject_front/domain/http_connector.dart';
import 'package:finalproject_front/dto/response/lesson_resp_dto.dart';
import 'package:finalproject_front/dto/response/respone_dto.dart';
import 'package:finalproject_front/util/response_util.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

final lessonHttprepository = Provider<LessonHttpRepository>((ref) {
  return LessonHttpRepository(ref);
});

class LessonHttpRepository {
  Ref _ref;
  LessonHttpRepository(this._ref);

  Future<List<LessonRespDto>> getLessonDetail(int id) async {
    Logger().d("id :", id);
    Response response = await _ref.read(httpConnector).get("/api/category/lesson/${id}");
    Logger().d("id 안나옴?:", id);
    ResponseDto responseDto = ResponseDto.fromJson(jsonDecode(response.body));
    List<dynamic> dataList = responseDto.data;
    List<LessonRespDto> LessonRespDtoList = dataList.map((lesson) => LessonRespDto.fromJson(lesson)).toList();
    return LessonRespDtoList;
  }

  // Future<List<LessonRespDto>> getLatestLesonList() async {
  //   Response response = await _ref.read(httpConnector).get("/api/lesson/latest");
  //   LessonRespDto responseDto =

  //   return;
  // }
}
