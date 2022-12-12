import 'dart:convert';

import 'package:finalproject_front/domain/http_connector.dart';
import 'package:finalproject_front/domain/user/user.dart';
import 'package:finalproject_front/dto/request/auth_req_dto.dart';
import 'package:finalproject_front/dto/response/respone_dto.dart';
import 'package:finalproject_front/dto/response/user_resp_dto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../pages/user/store_model/user_session.dart';
import '../../util/response_util.dart';

final userHttpRepository = Provider<UserHttpRepository>((ref) {
  return UserHttpRepository(ref);
});

// 회원 탈퇴, 회원가입 ,로그인, 로그아웃, 회원 정보 수정,내 정보 상세 보기
class UserHttpRepository {
  Ref _ref;
  UserHttpRepository(this._ref);

  Future<ResponseDto> join(JoinReqDto joinReqDto) async {
    String requestBody = jsonEncode(joinReqDto.toJson());
    Response response = await _ref.read(httpConnector).post("/api/join", requestBody);
    Logger().d("레포 확인 : ${response.statusCode}");

    return toResponseDto(response); // ResponseDto 응답
  }

  Future<ResponseDto> login(LoginReqDto loginReqDto) async {
    // 1. json 변환
    String requestBody = jsonEncode(loginReqDto.toJson());

    // 2. 통신 시작
    Response response = await _ref.read(httpConnector).post("/login", requestBody);

    // 3. 토큰 받기
    String jwtToken = response.headers["authorization"].toString();

    // 4. 토큰을 디바이스에 저장
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("jwtToken", jwtToken); // 자동 로그인시 필요

    Logger().d("토큰 값 확인 : ${jwtToken}");
    // 5. ResponseDto에서 User 꺼내기
    ResponseDto responseDto = toResponseDto(response);

    // 6. AuthProvider에 로긴 정보 저장
    UserRespDto user = UserRespDto.fromJson(responseDto.data);
    UserSession.login(user, jwtToken);

    return responseDto; // ResponseDto 응답
  }
}
