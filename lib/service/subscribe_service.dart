import 'package:finalproject_front/core/http_connector.dart';
import 'package:finalproject_front/core/util/response_util.dart';
import 'package:finalproject_front/dto/response/lesson_latest_list_resp_dto.dart';
import 'package:finalproject_front/dto/response/respone_dto.dart';
import 'package:finalproject_front/dto/response/subscribe_resp_dto.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

class SubscribeService {
  final HttpConnector httpConnector = HttpConnector();

  Future<ResponseDto> subscribeList(int userId, String? jwtToken) async {
    Response response = await httpConnector.get(path: "/api/user/${userId}/subscribe");

    ResponseDto responseDto = toResponseDto(response);

    Logger().d("메시지 : ${responseDto.msg}");
    Logger().d("데이터 : ${responseDto.data}");
    Logger().d("상태코드 : ${responseDto.statusCode}");

    // List<dynamic> mapList = responseDto.data; //responseDto.data를 dynamic타입으로 바꾸는 것
    // List<LessonLatestListRespDto> LessonLatestList = mapList.map((e) => LessonLatestListRespDto.fromJson(e)).toList();

    // responseDto.data = LessonLatestList;

    if (responseDto.statusCode < 300) {
      Logger().d("1");
      List<dynamic> mapList = responseDto.data; //responseDto.data를 dynamic타입으로 바꾸는 것
      Logger().d("2");
      List<SubscribeRespDto> subscribeList = mapList.map((e) => SubscribeRespDto.fromJson(e)).toList();
      Logger().d(subscribeList);

      responseDto.data = subscribeList; // ListSubscribeRespDto
    }

    return responseDto;
  }
}
