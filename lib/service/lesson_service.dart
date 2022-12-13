import 'package:finalproject_front/core/http_connector.dart';
import 'package:finalproject_front/dto/response/lesson_latest_list_resp_dto.dart';
import 'package:finalproject_front/dto/response/lesson_resp_dto.dart';
import 'package:finalproject_front/dto/response/respone_dto.dart';
import 'package:finalproject_front/core/util/response_util.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

class LessonService {
  final HttpConnector httpConnector = HttpConnector();

  Future<ResponseDto> getLessonDetail(int lessond) async {
    Logger().d("id출력service:${lessond}");

    Response response = await httpConnector.get(path: "/api/category/lesson/${lessond}");
    //.get("/api/category/lesson/${id}");

    ResponseDto responseDto = toResponseDto(response);
    //responseDto.data = UserRespDto.fromJson(jsonDecode(response));
    Logger().d("레슨 서비스 확인 : ${responseDto.msg}");
    Logger().d("레슨 데이터 확인 : ${responseDto.data}");

    responseDto.data = LessonRespDto.fromJson(responseDto.data);
    return responseDto;
  }

  Future<ResponseDto> homeList() async {
    Response response = await httpConnector.get(path: "/api/main");

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
