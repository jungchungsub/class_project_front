import 'dart:convert';

import 'package:finalproject_front/core/http_connector.dart';
import 'package:finalproject_front/dto/request/auth_req_dto.dart';
import 'package:finalproject_front/dto/response/profile_resp_dto.dart';
import 'package:finalproject_front/dto/response/respone_dto.dart';
import 'package:finalproject_front/dto/response/user_login_resp_dto.dart';
import 'package:finalproject_front/service/local_service.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

import '../domain/user_session.dart';
import '../core/util/response_util.dart';
import '../dto/response/user_update_resp_dto.dart';
import '../dto/response/my_page_resp_dto.dart';

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

  Future<ResponseDto> fetchJoin(JoinReqDto joinReqDto) async {
    // 1. json변환
    String requestBody = jsonEncode(joinReqDto.toJson());
    // 2. 통신 시작
    Response response = await httpConnector.post("/join", requestBody);

    return toResponseDto(response); // ResponseDto 응답
  }

  Future<ResponseDto> fetchLogin(LoginReqDto loginReqDto) async {
    String requestBody = jsonEncode(loginReqDto.toJson());
    Response response = await httpConnector.post("/login", requestBody);

    String jwtToken = response.headers["authorization"].toString();
    Logger().d("토큰 값 확인 : ${jwtToken}");

    await secureStorage.write(key: "jwtToken", value: jwtToken); // 토큰 값 디바이스에 저장
    ResponseDto responseDto = toResponseDto(response);
    Logger().d("loginDto data확인 : ${responseDto.data}");

// 로그인 정보 저장
    UserLoginRespDto user = UserLoginRespDto.fromJson(responseDto.data);
    Logger().d("userResp확인 : ${user}");
    UserSession.successAuthentication(user, jwtToken);

    return responseDto; // ResponseDto 응답
  }

// MyPage를 위한 유저 정보
  Future<ResponseDto> getUserInfoForMyPage(int userId, String? jwtToken) async {
    Response response = await httpConnector.get(path: "/api/user/${userId}/mypage", jwtToken: jwtToken);
    ResponseDto responseDto = toResponseDto(response);
    Logger().d("유저 서비스 : ${responseDto.data}");
    Logger().d("유저 서비스 : ${responseDto.statusCode}");
    Logger().d("유저 서비스 : ${responseDto.msg}");
    if (responseDto.data != null) {
      responseDto.data = MyPageRespDto.fromJson(responseDto.data);

      if (responseDto.data.role == "USER") {
        responseDto.data.role = "의뢰인";
      }
      if (responseDto.data.role == "MASTER") {
        responseDto.data.role = "전문가";
      }
    }
    return responseDto;
  }

//프로필 정보
  Future<ResponseDto> getDetailProfile(int userId, String? jwtToken) async {
    Response response = await httpConnector.get(path: "/api/user/${userId}/profile", jwtToken: jwtToken);
    ResponseDto responseDto = toResponseDto(response);
    Logger().d("프로필 정보 확인 : ${responseDto.data}");
    Logger().d("프로필 정보 확인 : ${responseDto.statusCode}");
    Logger().d("프로필 정보 확인 : ${responseDto.msg}");

    if (responseDto.data != null) {
      dynamic mapList = responseDto.data; // dynamic
      ProfileDetailRespDto profileDetail = mapList.map((e) => ProfileDetailRespDto.fromJson(e));
      Logger().d(profileDetail);
      responseDto.data = profileDetail;
    }
    Logger().d("service 출력 : ${responseDto.data}");
    return responseDto;
  }

//업데이트
  Future<ResponseDto> fetchUpdateUser(int userId, UpdateUserReqDto updateUserReqDto) async {
    String requestBody = jsonEncode(updateUserReqDto);
    Response response = await httpConnector.put(path: "/api/user/${userId}", body: requestBody);
    ResponseDto responseDto = toResponseDto(response);
    Logger().d("responseDto 통신 체크 : ${responseDto.statusCode}");
    Logger().d("responseDto 통신 체크 : ${responseDto.msg}");
    Logger().d("responseDto 통신 체크 : ${responseDto.data}");

    if (responseDto.data != null) {
      responseDto.data = UserUpdateResponseDto.fromJson(responseDto.data);
      //UserSession.successAuthentication(user);
    }
    return responseDto;
  }
}
