import 'dart:convert';

import 'package:finalproject_front/core/http_connector.dart';
import 'package:finalproject_front/domain/user_session.dart';
import 'package:finalproject_front/dto/request/auth_req_dto.dart';
import 'package:finalproject_front/dto/request/profile_insert_req_dto.dart';
import 'package:finalproject_front/dto/request/profile_req_dto.dart';
import 'package:finalproject_front/dto/response/profile_resp_dto.dart';
import 'package:finalproject_front/dto/response/respone_dto.dart';
import 'package:finalproject_front/service/local_service.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

import '../core/util/response_util.dart';
import '../dto/response/my_page_resp_dto.dart';
import '../dto/response/user_update_resp_dto.dart';

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
    Response response = await httpConnector.post(path: "/api/join", body: requestBody);

    return toResponseDto(response); // ResponseDto 응답
  }

  Future<ResponseDto> fetchLogin(LoginReqDto loginReqDto) async {
    String requestBody = jsonEncode(loginReqDto.toJson());
    Response response = await httpConnector.post(path: "/login", body: requestBody);

    String jwtToken = response.headers["authorization"].toString();

    await secureStorage.write(key: "jwtToken", value: jwtToken); // 토큰 값 디바이스에 저장
    ResponseDto responseDto = toResponseDto(response);

    return responseDto; // ResponseDto 응답
  }

// MyPage를 위한 유저 정보
  Future<ResponseDto> getUserInfoForMyPage(int userId, String? jwtToken) async {
    Response response = await httpConnector.get(path: "/api/user/${userId}/mypage");
    ResponseDto responseDto = toResponseDto(response);
    if (responseDto.data != null) {
      responseDto.data = MyPageRespDto.fromJson(responseDto.data);
    }
    return responseDto;
  }

//프로필 정보
  Future<ResponseDto> getDetailProfile(int userId) async {
    Logger().d("프로필 아이디 보기 : ${userId}");
    Logger().d("세션 id확인 : ${UserSession.user.id}");
    Response response = await httpConnector.get(path: "/api/user/${userId}/profile");
    Logger().d("프로필 상세보기 응답 바디 - 서비스 : ${response.body}");
    ResponseDto responseDto = toResponseDto(response);
    Logger().d("응답 데이터 확인 - 서비스 : ${responseDto.data}");
    // final introduction = responseDto.data["introduction"];
    // final region = responseDto.data["region"];
    // final certification = responseDto.data["certification"];
    // final careerYear = responseDto.data["careerYear"];
    // final career = responseDto.data["career"];

    // if (introduction == null) {
    //   responseDto.data["introduction"] = "자기 소개를 작성해주세요.";
    // }
    // if (introduction == null) {
    //   responseDto.data["introduction"] = "자기 소개를 작성해주세요.";
    // }
    // if (region == null) {
    //   responseDto.data["region"] = "지역을 작성해주세요.";
    // }

    // if (certification == null) {
    //   responseDto.data["certification"] = "보유 자격증을 작성해주세요.";
    // }
    // if (careerYear == null) {
    //   responseDto.data["careerYear"] = "경력 기간을 작성해주세요.";
    // }
    // if (career == null) {
    //   responseDto.data["career"] = "학력 및 전공을 작성해주세요.";
    // }

    if (responseDto.data != null) {
      responseDto.data = ProfileRespDto.fromJson(responseDto.data);
    }
    return responseDto;
  }

//업데이트
  Future<ResponseDto> fetchUpdateUser(int userId, updateUserReqDto) async {
    String requestBody = jsonEncode(updateUserReqDto);
    Response response = await httpConnector.put(path: "/api/user/${userId}", body: requestBody);
    ResponseDto responseDto = toResponseDto(response);
    if (responseDto.data != null) {
      responseDto.data = UserUpdateResponseDto.fromJson(responseDto.data);
      //UserSession.successAuthentication(user);
    }
    return responseDto;
  }

  Future<ResponseDto> fetchUpdateProfile(int userId, ProfileUpdateReqDto profileUpdateReqDto) async {
    String requestBody = jsonEncode(profileUpdateReqDto);
    Logger().d("프로필 업데이트 바디 확인 : ${requestBody}");

    Response response = await httpConnector.put(path: "/api/user/$userId/profile", body: requestBody);
    ResponseDto responseDto = toResponseDto(response);
    Logger().d("프로필 업데이트 확인 : ${responseDto.data}");
    Logger().d("프로필 업데이트 확인 : ${responseDto.statusCode}");

    return responseDto;
  }

  Future<ResponseDto> fetchInsertProfile(ProfileInsertReqDto profileInsertReqDto) async {
    String requestBody = jsonEncode(profileInsertReqDto);
    Logger().d("프로필 등록 바디 확인 : ${requestBody}");
    Response response = await httpConnector.post(path: "/api/profile", body: requestBody);
    ResponseDto responseDto = toResponseDto(response);
    Logger().d("프로필 등록 값 확인 : ${responseDto.data}");
    Logger().d("프로필 등록 값 확인 : ${responseDto.statusCode}");
    return responseDto;
  }
}
