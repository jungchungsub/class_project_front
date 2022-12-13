import 'dart:convert';

import 'package:finalproject_front/core/http_connector.dart';
import 'package:finalproject_front/domain/lesson.dart';
import 'package:finalproject_front/dto/response/lesson_latest_list_resp_dto.dart';
import 'package:finalproject_front/dto/response/lesson_resp_dto.dart';
import 'package:finalproject_front/dto/response/respone_dto.dart';
import 'package:finalproject_front/dto/response/user_resp_dto.dart';
import 'package:finalproject_front/util/response_util.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

class LessonService {
  final HttpConnector httpConnector = HttpConnector();

  Future<ResponseDto> getLessonDetail(int lessond) async {
    Logger().d("id출력service:${lessond}");

    Response response = await httpConnector.get("/api/category/lesson/${lessond}");
    //.get("/api/category/lesson/${id}");
    Logger().d("response출력 : ${response.body}");
    Logger().d("상태코드 출력: ${response.statusCode}");
    ResponseDto responseDto = toResponseDto(response);
    //responseDto.data = UserRespDto.fromJson(jsonDecode(response));

    Logger().d("ResponseMsg 출력 : ${responseDto.msg}");
    responseDto.data = LessonRespDto.fromJson(responseDto.data);
    return responseDto;
  }

  Future<ResponseDto> homeList() async {
    Response response = await httpConnector.get("/api/main");

    ResponseDto responseDto = toResponseDto(response);
    if (responseDto.statusCode > 0 || responseDto.statusCode < 300) {
      List<dynamic> mapList = responseDto.data;
      List<LessonLatestListRespDto> LessonLatestList = mapList.map((e) => LessonLatestListRespDto.fromJson(e)).toList();
      responseDto.data = LessonLatestList;
    }
    return responseDto;
  }

  // Future<List<LessonRespDto>> getLatestLesonList() async {
  //   Response response = await _ref.read(httpConnector).get("/api/lesson/latest");
  //   LessonRespDto responseDto =

  //   return;
  // }
}
