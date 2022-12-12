import 'package:finalproject_front/core/http_connector.dart';
import 'package:finalproject_front/domain/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../dto/response/respone_dto.dart';
import '../dto/response/user_resp_dto.dart';
import '../domain/user_session.dart';
import '../util/response_util.dart';

// Create storage
const storage = FlutterSecureStorage();

class LocalService {
  final HttpConnector httpConnector = HttpConnector();

  static final LocalService _instance = LocalService._single();
  LocalService._single();
  factory LocalService() {
    return _instance;
  }

  Future<void> fetchJwtToken() async {
    Logger().d("jwt init");
    // 디바이스에 저장된 토큰 값 가져옴
    String? deviceJwtToken = await storage.read(key: "jwtToken");

    if (deviceJwtToken != null) {
      // 디바이스에 저장된 jwt토큰이 있다면 서버에서 토큰값을 통해 유저의 정보 Get 요청
      Response response = await httpConnector.getInitSession("/api/user/session", deviceJwtToken);
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
