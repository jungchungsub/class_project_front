import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

final httpConnector = Provider<HttpConnector>((ref) {
  return HttpConnector();
});

class HttpConnector {
// header에 content 타입 필요
  Map<String, String> headers = {"Content-Type": "application/json;charset=utf-8"};

  final host = "http://localhost:8000";
  final Client _client = Client();

  // 최초 자동 로그인시에 세션이 없기 때문에 jwtToken을 storage에서 가져와서 세션 초기화함.

  Future<Response> getInitSession(String path, String? jwtToken) async {
    Map<String, String> requestHeader = {...headers, "Authorization": jwtToken!};
    Uri uri = Uri.parse("${host}${path}");
    Response response = await Client().get(uri, headers: requestHeader);
    return response;
  }

  Future<Response> get(String path) async {
    Logger().d("connecter");
    Uri uri = Uri.parse("${host}${path}");
    Logger().d("uri 확인 : ${uri}");
    Response response = await _client.get(uri);
    Logger().d("connecter333");
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
