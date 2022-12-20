import 'package:finalproject_front/core/http_connector.dart';
import 'package:finalproject_front/core/util/response_util.dart';
import 'package:finalproject_front/dto/response/lesson_latest_list_resp_dto.dart';
import 'package:finalproject_front/dto/response/respone_dto.dart';
import 'package:finalproject_front/dto/response/subscribe_resp_dto.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

class SubscribeService {
  final HttpConnector httpConnector = HttpConnector();

  static final SubscribeService _instance = SubscribeService._single();
  SubscribeService._single();
  factory SubscribeService() {
    return _instance;
  }
  Future<ResponseDto> subscribeList(int userId, String? jwtToken) async {
    Response response = await httpConnector.get(path: "/api/user/${userId}/subscribe");

    ResponseDto responseDto = toResponseDto(response);
    if (responseDto.statusCode < 300) {
      List<dynamic> mapList = responseDto.data; //responseDto.data를 dynamic타입으로 바꾸는 것
      List<SubscribeRespDto> subscribeList = mapList.map((e) => SubscribeRespDto.fromJson(e)).toList();
      responseDto.data = subscribeList; // ListSubscribeRespDto
    }

    return responseDto;
  }
}
