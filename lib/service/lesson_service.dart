import 'dart:convert';
import 'dart:developer';

import 'package:finalproject_front/core/http_connector.dart';
import 'package:finalproject_front/dto/request/lesson_update_req_dto.dart';
import 'package:finalproject_front/dto/response/lesson_latest_list_resp_dto.dart';
import 'package:finalproject_front/dto/response/lesson_resp_dto.dart';
import 'package:finalproject_front/dto/response/respone_dto.dart';
import 'package:finalproject_front/core/util/response_util.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

class LessonService {
  final HttpConnector httpConnector = HttpConnector();

  Future<ResponseDto> fetchLessonDetail(int lessonId) async {
    Response response = await httpConnector.get(path: "/api/category/lesson/${lessonId}");
    Logger().d(response.body);
    ResponseDto responseDto = toResponseDto(response);
    final value = responseDto.data["lessonAvgGrade"];
    if (value == "NaN") {
      responseDto.data["lessonAvgGrade"] = 0.0;
    }
    responseDto.data = LessonRespDto.fromJson(responseDto.data);
    return responseDto;
  }

  Future<ResponseDto> fetchHomeList() async {
    Response response = await httpConnector.get(path: "/api/main");
    ResponseDto responseDto = toResponseDto(response);
    Logger().d(responseDto.data);
    if (responseDto.statusCode < 400) {
      List<dynamic> mapList = responseDto.data; //responseDto.data를 dynamic타입으로 바꾸는 것
      List<LessonLatestListRespDto> LessonLatestList = mapList.map((e) => LessonLatestListRespDto.fromJson(e)).toList();

      responseDto.data = LessonLatestList;
    }
    return responseDto;
  }

  Future<ResponseDto> fetchlessonInsert(LessonUpdateReqDto lessonReqDto) async {
    String requestBody = jsonEncode(lessonReqDto);
    Response response = await httpConnector.post(path: "/api/lesson", body: requestBody);
    ResponseDto responseDto = toResponseDto(response);
    return responseDto;
  }

  Future<ResponseDto> fetchUpdateLesson(int lessonId, LessonUpdateReqDto lessonUpdateReqDto) async {
    String requestBody = jsonEncode(lessonUpdateReqDto);
    Response response = await httpConnector.put(path: "/api/lesson/${lessonId}", body: requestBody);
    ResponseDto responseDto = toResponseDto(response);
    // if (responseDto.data != null) {
    //   // responseDto.data = 레슨리스폰스디티오생성
    // }
    return responseDto;
  }
}
