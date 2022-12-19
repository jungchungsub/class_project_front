// main 시작전에 확인이 필요해서 provider가 아닌 static으로 관리

import 'package:finalproject_front/service/payment_local_service.dart';

class IamportToken {
  static String? _accessToken;

  static get acessesToken => _accessToken;

  static successAuthentication(String accessToken) {
    _accessToken = accessToken;
  }

  static Future<void> removeAuthentication() async {
    _accessToken = null;
    await PaymentLocalService().fetchDeleteJwtToken();
  }

  static Map<String, String> getJwtTokenHeader(Map<String, String> headers) {
    return IamportToken._accessToken == null ? headers : {...headers, "Authorization": IamportToken._accessToken!};
  }
}
