import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

final paymentHttpConnector = Provider<PaymentHttpConnector>((ref) {
  return PaymentHttpConnector();
});

class PaymentHttpConnector {
  final host = "https://api.iamport.kr/";
  final headers = {"Content-Type": "application/json; charset=utf-8"};
  final Client _client = Client();

  Future<Response> getInitSession(String path, String? accessToken) async {
    Map<String, String> requestHeader = {...headers, "Authorization": accessToken!};
    Uri uri = Uri.parse("${host}${path}");
    Response response = await Client().get(uri, headers: requestHeader);
    return response;
  }

  Future<Response> get(String path) async {
    Uri uri = Uri.parse("${host}${path}");
    Response response = await _client.get(uri);
    return response;
  }

  Future<Response> post(String path, String body) async {
    Uri uri = Uri.parse("${host}${path}");
    Response response = await _client.post(uri, body: body, headers: headers);
    return response;
  }

  Future<Response> postInitSession(String path, String body, String? accessToken) async {
    Map<String, String> requestHeader = {...headers, "Authorization": accessToken!};
    Uri uri = Uri.parse("${host}${path}");
    Response response = await _client.post(uri, body: body, headers: requestHeader);
    return response;
  }
}
