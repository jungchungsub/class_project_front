import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

final httpConnector = Provider<HttpConnector>((ref) {
  return HttpConnector();
});

class HttpConnector {
// header에 content 타입 필요
  Map<String, String> headers = {"Content-Type": "application/json;charset=utf-8"};

  final host = "http://192.168.0.87:8000";
  final Client _client = Client();

  // 최초 자동 로그인시에 세션이 없기 때문에 jwtToken을 storage에서 가져와서 세션 초기화함.

  Future<Response> getInitSession(String path, String? jwtToken) async {
    Logger().d("initSession실행됌");
    Map<String, String> requestHeader = {...headers, "Authorization": jwtToken!};
    Uri uri = Uri.parse("${host}${path}");
    Response response = await Client().post(uri, headers: requestHeader);
    Logger().d("initSession Response확인 ${response.body}");
    return response;
  }

  Future<Response> get({required String path, String? jwtToken}) async {
    if (jwtToken != null) {
      Logger().d("토큰 있을 경우 실행");
      Map<String, String> requestHeader = {...headers, "Authorization": jwtToken};
      Uri uri = Uri.parse("${host}${path}");
      Response response = await Client().get(uri, headers: requestHeader);
      return response;
    }
    Logger().d("토큰 없을 경우 실행");
    Uri uri = Uri.parse("${host}${path}");
    Logger().d("실행, 경로 확인${uri}");

    Response response = await _client.get(uri);
    return response;
  }

  Future<Response> post(String path, String body) async {
    Uri uri = Uri.parse("${host}${path}");
    Response response = await _client.post(uri, body: body, headers: headers);

    return response;
  }

  Future<Response> delete(String path) async {
    Uri uri = Uri.parse("${host}${path}");
    Response response = await _client.delete(uri, headers: headers);
    return response;
  }

  Future<Response> put(String path, String body) async {
    Uri uri = Uri.parse("${host}${path}");
    Response response = await _client.put(uri, body: body, headers: headers);
    return response;
  }
}
