import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
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
