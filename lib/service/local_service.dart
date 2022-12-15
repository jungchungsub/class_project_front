import 'package:finalproject_front/core/http_connector.dart';
import 'package:finalproject_front/domain/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

import '../core/util/response_util.dart';
import '../domain/user_session.dart';
import '../core/util/response_util.dart';
import '../domain/user_session.dart';
import '../dto/response/respone_dto.dart';
import '../dto/response/user_login_resp_dto.dart';

// Create storage
const secureStorage = FlutterSecureStorage();

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
    String? deviceJwtToken = await secureStorage.read(key: "jwtToken");
    Logger().d(" 디바이스 토큰 확인 : ${deviceJwtToken}");
    if (deviceJwtToken != null) {
      // 디바이스에 저장된 jwt토큰이 있다면 서버에서 토큰값을 통해 유저의 정보 Get 요청
      Response response = await httpConnector.getInitSession("/api/user/session", deviceJwtToken);
      ResponseDto responseDto = toResponseDto(response);
      if (responseDto.statusCode < 400) {
        User user = User.fromJson(responseDto.data);
        UserSession.successAuthentication(user, deviceJwtToken);
      } else {
        Logger().d("여기 실행됨? ${responseDto.msg}");
        Logger().d("토큰이 만료됨");
        Logger().d("${responseDto.msg}");
        UserSession.removeAuthentication();
      }
    }
  }

  Future<void> fetchDeleteJwtToken() async {
    // 스토어에 저장된 토큰 삭제
    await secureStorage.delete(key: "jwtToken");
  }
}
