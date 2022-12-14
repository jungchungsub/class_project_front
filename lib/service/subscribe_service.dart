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
    Response response = await httpConnector.get(path: "/api/user${userId}/subscribe", jwtToken: jwtToken);
    Logger().d("확인중 :${userId} ");

    ResponseDto responseDto = toResponseDto(response);
    Logger().d("좋아요 데이터 확인 : ${responseDto.data}");

    if (responseDto.statusCode < 300) {
      List<dynamic> mapList = responseDto.data;
      List<SubscribeListRespDto> SubscribeList = mapList.map((e) => SubscribeListRespDto.fromJson(e)).toList();

      responseDto.data = SubscribeList;
    }
    return responseDto;
  }
}
