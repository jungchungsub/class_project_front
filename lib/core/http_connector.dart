import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

import '../domain/user_session.dart';

final httpConnector = Provider<HttpConnector>((ref) {
  return HttpConnector();
});

class HttpConnector {
// header에 content 타입 필요
  Map<String, String> headers = {"Content-Type": "application/json;charset=utf-8"};

  final host = "http://192.168.0.87:8000";
  final host2 = "http://localhost:8000";
  final host3 = "http://192.168.0.4:8000";
  final Client _client = Client();

  // 최초 자동 로그인시에 세션이 없기 때문에 jwtToken을 storage에서 가져와서 세션 초기화함.

  Future<Response> getInitSession(String path, String? jwtToken) async {
    Logger().d("initSession실행됨");
    Map<String, String> requestHeader = {...headers, "Authorization": jwtToken!};
    Uri uri = Uri.parse("${host}${path}");
    Response response = await Client().post(uri, headers: requestHeader);
    return response;
  }

  Future<Response> get({required String path}) async {
    if (UserSession.isLogin == true) {
      String jwtToken = UserSession.jwtToken;
      Map<String, String> requestHeader = {...headers, "Authorization": jwtToken};
      Uri uri = Uri.parse("${host}${path}");
      Response response = await Client().get(uri, headers: requestHeader);
      return response;
    } else {
      Uri uri = Uri.parse("${host}${path}");
      Response response = await Client().get(uri);
      return response;
    }
  }

  Future<Response> post({required String path, required String body}) async {
    Map<String, String> requestHeader = UserSession.getTokenHeader(headers);
    Uri uri = Uri.parse("${host}${path}");
    Response response = await Client().post(uri, body: body, headers: requestHeader);

    return response;
  }

  Future<Response> delete(String path) async {
    Map<String, String> requestHeader = UserSession.getTokenHeader(headers);
    Uri uri = Uri.parse("${host}${path}");
    Response response = await _client.delete(uri, headers: requestHeader);
    return response;
  }

  Future<Response> put({required String path, String? body}) async {
    Map<String, String> requestHeader = UserSession.getTokenHeader(headers);
    Uri uri = Uri.parse("${host}${path}");
    Response response = await Client().put(uri, body: body, headers: requestHeader);
    return response;
  }

//==============================Mac==========================================//

  // Future<Response> getInitSession(String path, String? jwtToken) async {
  //   Logger().d("initSession실행됨");
  //   Map<String, String> requestHeader = {...headers, "Authorization": jwtToken!};
  //   Uri uri = Uri.parse("${host3}${path}");
  //   Response response = await Client().post(uri, headers: requestHeader);
  //   return response;
  // }

  // Future<Response> get({required String path}) async {
  //   String jwtToken = UserSession.jwtToken;
  //   Map<String, String> requestHeader = {...headers, "Authorization": jwtToken};
  //   Logger().d("http통신 잘되었는가? ");
  //   Uri uri = Uri.parse("${host3}${path}");
  //   Logger().d("uri 오류${uri}");
  //   Response response = await Client().get(uri, headers: requestHeader);
  //   Logger().d("httpConnector  : ${response}");
  //   return response;
  // }

  // Future<Response> post({required String path, required String body}) async {
  //   Map<String, String> requestHeader = UserSession.getTokenHeader(headers);
  //   Uri uri = Uri.parse("${host3}${path}");
  //   Response response = await Client().post(uri, body: body, headers: requestHeader);

  //   return response;
  // }

  // Future<Response> delete(String path) async {
  //   Map<String, String> requestHeader = UserSession.getTokenHeader(headers);
  //   Uri uri = Uri.parse("${host3}${path}");
  //   Response response = await _client.delete(uri, headers: requestHeader);
  //   return response;
  // }

  // Future<Response> put({required String path, String? body}) async {
  //   Map<String, String> requestHeader = UserSession.getTokenHeader(headers);
  //   Uri uri = Uri.parse("${host3}${path}");
  //   Response response = await Client().put(uri, body: body, headers: requestHeader);
  //   return response;
  // }

//==============================Mac==========================================//

  // Future<Response> getInitSession(String path, String? jwtToken) async {
  //   Logger().d("initSession실행됨");
  //   Map<String, String> requestHeader = {...headers, "Authorization": jwtToken!};
  //   Uri uri = Uri.parse("${host2}${path}");
  //   Response response = await Client().post(uri, headers: requestHeader);
  //   return response;
  // }

  // Future<Response> get({required String path}) async {
  //   if (UserSession.isLogin == true) {
  //     String jwtToken = UserSession.jwtToken;
  //     Map<String, String> requestHeader = {...headers, "Authorization": jwtToken};
  //     Uri uri = Uri.parse("${host2}${path}");
  //     Response response = await Client().get(uri, headers: requestHeader);
  //     return response;
  //   } else {
  //     Uri uri = Uri.parse("${host2}${path}");
  //     Response response = await Client().get(uri);
  //     return response;
  //   }
  // }

  // Future<Response> post({required String path, required String body}) async {
  //   Map<String, String> requestHeader = UserSession.getTokenHeader(headers);
  //   Uri uri = Uri.parse("${host2}${path}");
  //   Response response = await Client().post(uri, body: body, headers: requestHeader);

  //   return response;
  // }

  // Future<Response> delete(String path) async {
  //   Map<String, String> requestHeader = UserSession.getTokenHeader(headers);
  //   Uri uri = Uri.parse("${host2}${path}");
  //   Response response = await _client.delete(uri, headers: requestHeader);
  //   return response;
  // }

  // Future<Response> put({required String path, String? body}) async {
  //   Map<String, String> requestHeader = UserSession.getTokenHeader(headers);
  //   Uri uri = Uri.parse("${host2}${path}");
  //   Response response = await Client().put(uri, body: body, headers: requestHeader);
  //   return response;
  // }

//==============================Mac==========================================//
}
