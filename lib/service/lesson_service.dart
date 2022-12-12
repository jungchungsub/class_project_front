import 'dart:convert';

import 'package:finalproject_front/core/http_connector.dart';
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
    Logger().d("id출력service:${id}");
    Response response = await _ref.read(httpConnector).get("/api/category/lesson/${id}");
    Logger().d("response출력 : ${response.body}");
    Logger().d("상태코드 출력: ${response.statusCode}");
    ResponseDto responseDto = ResponseDto.fromJson(jsonDecode(response.body));
    Logger().d("ResponseData 출력 : ${responseDto.data}");
    Logger().d("Response상태코드 출력 : ${responseDto.statusCode}");
    Logger().d("ResponseMsg 출력 : ${responseDto.msg}");
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
