import 'dart:convert';

import 'package:finalproject_front/core/http_connector.dart';
import 'package:finalproject_front/dto/request/auth_req_dto.dart';
import 'package:finalproject_front/dto/response/respone_dto.dart';
import 'package:finalproject_front/dto/response/user_resp_dto.dart';
import 'package:finalproject_front/service/local_service.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

import '../domain/user_session.dart';
import '../core/util/response_util.dart';

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
    String requestBody = jsonEncode(loginReqDto.toJson());
    Response response = await httpConnector.post("/login", requestBody);

    String jwtToken = response.headers["authorization"].toString();
    Logger().d("토큰 값 확인 : ${jwtToken}");

    await secureStorage.write(key: "jwtToken", value: jwtToken); // 토큰 값 디바이스에 저장
    ResponseDto responseDto = toResponseDto(response);
    Logger().d("loginDto data확인 : ${responseDto.data}");

// 로그인 정보 저장
    UserRespDto user = UserRespDto.fromJson(responseDto.data);
    UserSession.successAuthentication(user, jwtToken);

    return responseDto; // ResponseDto 응답
  }

// MyPage를 위한 유저 정보
  Future<ResponseDto> getUserInfoForMyPage(int userId, String? jwtToken) async {
    Response response = await httpConnector.get(path: "/api/user/${userId}/mypage", jwtToken: jwtToken);
    ResponseDto responseDto = toResponseDto(response);
    return responseDto;
  }

//프로필 정보
  Future<ResponseDto> getDetailProfile(int userId, String? jwtToken) async {
    Response response = await httpConnector.get(path: "/api/user/${userId}/profile", jwtToken: jwtToken);
    ResponseDto responseDto = toResponseDto(response);
    Logger().d("service 출력 : ${responseDto.data}");
    return responseDto;
  }
}
