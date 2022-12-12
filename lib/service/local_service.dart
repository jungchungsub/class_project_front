import 'package:finalproject_front/core/http_connector.dart';
import 'package:finalproject_front/domain/user.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../dto/response/respone_dto.dart';
import '../dto/response/user_resp_dto.dart';
import '../domain/user_session.dart';
import '../util/response_util.dart';

class LocalService {
  final HttpConnector httpConnector = HttpConnector();

  static final LocalService _instance = LocalService._single(); //싱글톤 패턴 관리
  LocalService._single();
  factory LocalService() {
    Logger().d("LocalRepository 생성자");
    return _instance;
  }

  Future<void> initShardJwtToken() async {
    Logger().d("jwt init");
    // 디바이스에 저장된 토큰 값 가져옴
    final prefs = await SharedPreferences.getInstance();
    final deviceJwtToken = prefs.getString("jwtToken");

    // 디바이스에 저장된 jwt토큰이 있다면 서버에서 토큰값을 통해 유저의 정보 Get 요청
    if (deviceJwtToken != null) {
      Response response = await httpConnector.get("/jwtToken");
      ResponseDto respDto = toResponseDto(response);

      if (respDto.statusCode == 201) {
        UserRespDto user = UserRespDto.fromJson(respDto.data);
        UserSession.login(user, deviceJwtToken);
      } else {
        Logger().d("토큰이 만료됨");
        UserSession.logout();
      }
    }
  }

  Future<void> removeShardJwtToken() async {
    Logger().d("jwt remove");
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("jwtToken");
  }
}
