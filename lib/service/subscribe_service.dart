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
    Logger().d(responseDto.statusCode);

    if (responseDto.statusCode < 300) {
      // List<dynamic> mapList = responseDto.data;
      // Logger().d(mapList);
      // List<SubscribeRespDto> SubscribeList = mapList.map((e) => SubscribeRespDto.fromJson(e)).toList();
      // Logger().d(SubscribeList);
      responseDto.data = SubscribeRespDto.fromJson(responseDto.data);
    }
    return responseDto;
  }
}
