import 'dart:convert';

import 'package:finalproject_front/domain/http_connector.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

import 'user.dart';

final userHttpRepository = Provider<UserHttpRepository>((ref) {
  return UserHttpRepository(ref);
});

// 회원 탈퇴, 회원가입 ,로그인, 로그아웃, 회원 정보 수정,내 정보 상세 보기
class UserHttpRepository {
  Ref _ref;
  UserHttpRepository(this._ref);

// 회원가입
  Future<User> join(User userReqDto) async {
    String body = jsonEncode(userReqDto.toJson()); // 값을 json으로 body에 담아서 전달
    Response resp = await _ref.read(httpConnector).post("/api/join", body);
    User user = User.fromJson(
        jsonDecode(resp.body)["data"]); // data는 백엔드에서 응답코드를 data로 작성함.
    return user;
  }
}
