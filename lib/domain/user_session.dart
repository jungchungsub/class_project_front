import 'package:logger/logger.dart';

import '../service/local_service.dart';
import '../dto/response/user_login_resp_dto.dart';

// main 시작전에 확인이 필요해서 provider가 아닌 static으로 관리
class UserSession {
  static UserLoginRespDto? _user;
  static String? _jwtToken;
  static bool _isLogin = false;

  static get user => _user;
  static get jwtToken => _jwtToken;
  static get isLogin => _isLogin;

  static void successAuthentication(UserLoginRespDto userParam, String jwtToken) {
    _user = userParam;
    _isLogin = true;
    _jwtToken = jwtToken;
  }

  static Future<void> removeAuthentication() async {
    _user = null;
    _jwtToken = null;
    _isLogin = false;
    await LocalService().fetchDeleteJwtToken();
    Logger().d("세션 종료 및 디바이스 토큰 삭제");
  }

  static Map<String, String> getTokenHeader(Map<String, String> headers) {
    // 토큰 값이 null이면 토큰 값 추가, ...header => 깊은 복사
    return UserSession._jwtToken == null ? headers : {...headers, "Authorization": UserSession._jwtToken!};
  }
}
