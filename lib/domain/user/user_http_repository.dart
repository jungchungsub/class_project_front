import 'dart:convert';

import 'package:finalproject_front/domain/http_connector.dart';
import 'package:finalproject_front/dto/request/user_req_dto.dart';
import 'package:finalproject_front/dto/response/respone_dto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

import '../../dto/response/user_resp_dto.dart';
import 'user.dart';

final userHttpRepository = Provider<UserHttpRepository>((ref) {
  return UserHttpRepository(ref);
});

// 회원 탈퇴, 회원가입 ,로그인, 로그아웃, 회원 정보 수정,내 정보 상세 보기
class UserHttpRepository {
  Ref _ref;
  UserHttpRepository(this._ref);

// 회원가입
  Future<ResponseDto> join(UserReqDto userReqDto) async {
    //임시데이터
    userReqDto = UserReqDto(
        username: "ssar",
        password: "1234",
        email: "1234@naver.com",
        phoneNum: "01012345678",
        role: "수강생",
        categoryId: [1, 2, 3]);

    String body = jsonEncode(userReqDto.toJson()); // 값을 json으로 body에 담아서 전달
    print(body);
    Response resp = await _ref.read(httpConnector).post("/api/join", body);
    ResponseDto respDto = ResponseDto.fromJson(jsonDecode(resp.body));
    return respDto;
  }
}
