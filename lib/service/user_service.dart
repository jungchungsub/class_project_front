import 'dart:convert';

import 'package:finalproject_front/core/http_connector.dart';
import 'package:finalproject_front/dto/request/auth_req_dto.dart';
import 'package:finalproject_front/dto/response/respone_dto.dart';
import 'package:finalproject_front/dto/response/user_resp_dto.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../domain/user_session.dart';
import '../util/response_util.dart';

// 회원 탈퇴, 회원가입 ,로그인, 로그아웃, 회원 정보 수정,내 정보 상세 보기
class UserService {
  final HttpConnector httpConnector = HttpConnector();

  //싱글톤 관리
  static final UserService _instance = UserService._single();
  UserService._single();
  // factory는 java = ioc컨테이너와 비슷한 역할을함.
  factory UserService() {
    return _instance;
  }

  Future<ResponseDto> join(JoinReqDto joinReqDto) async {
    // 1. json변환
    String requestBody = jsonEncode(joinReqDto.toJson());
    // 2. 통신 시작
    Response response = await httpConnector.post("/join", requestBody);

    return toResponseDto(response); // ResponseDto 응답
  }

  Future<ResponseDto> login(LoginReqDto loginReqDto) async {
    // 1. json 변환
    String requestBody = jsonEncode(loginReqDto.toJson());

    // 2. 통신 시작
    Response response = await httpConnector.post("/login", requestBody);

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
