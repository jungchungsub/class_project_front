import 'dart:convert';
import 'dart:developer';

import 'package:finalproject_front/core/http_connector.dart';
import 'package:finalproject_front/dto/request/lesson_req_dto.dart';
import 'package:finalproject_front/dto/response/lesson_latest_list_resp_dto.dart';
import 'package:finalproject_front/dto/response/lesson_resp_dto.dart';
import 'package:finalproject_front/dto/response/respone_dto.dart';
import 'package:finalproject_front/core/util/response_util.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

class LessonService {
  final HttpConnector httpConnector = HttpConnector();

  Future<ResponseDto> fetchLessonDetail(int lessonId, String? jwtToken) async {
    //Logger().d("id출력service:${lessonId}");
    Response response = await httpConnector.get(path: "/api/category/lesson/${lessonId}");
    ResponseDto responseDto = toResponseDto(response);
    Logger().d(response.body);
    final value = responseDto.data["lessonAvgGrade"];
    Logger().d("value 값 : ${value}");
    if (value == "NaN") {
      responseDto.data["lessonAvgGrade"] = 0.0;
    }
    Logger().d(responseDto.data["lessonAvgGrade"]);
    Logger().d("~~~~~~~~~~~~~");
    responseDto.data = LessonRespDto.fromJson(responseDto.data);
    //Logger().d("데이터확인 : ${responseDto.data}");
    return responseDto;
  }

  Future<ResponseDto> fetchHomeList(String? jwtToken) async {
    Response response = await httpConnector.get(path: "/api/main");

    ResponseDto responseDto = toResponseDto(response); //
    if (responseDto.statusCode < 300) {
      List<dynamic> mapList = responseDto.data; //responseDto.data를 dynamic타입으로 바꾸는 것
      // Logger().d(mapList);
      List<LessonLatestListRespDto> LessonLatestList = mapList.map((e) => LessonLatestListRespDto.fromJson(e)).toList();
      //mapList하나하나를 fromjson하고 tolist로 묶음

      responseDto.data = LessonLatestList;
    }
    return responseDto;
  }

  Future<ResponseDto> fetchlessonInsert(LessonInsertReqDto lessonReqDto) async {
    String requestBody = jsonEncode(lessonReqDto);
    Response response = await httpConnector.post(path: "/api/lesson", body: requestBody);
    ResponseDto responseDto = toResponseDto(response);
    return responseDto;
  }
}
