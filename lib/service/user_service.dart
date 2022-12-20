import 'dart:convert';

import 'package:finalproject_front/core/http_connector.dart';
import 'package:finalproject_front/domain/user_session.dart';
import 'package:finalproject_front/dto/request/auth_req_dto.dart';
import 'package:finalproject_front/dto/request/profile_req_dto.dart';
import 'package:finalproject_front/dto/response/buying_list_resp_dto.dart';
import 'package:finalproject_front/dto/response/selling_List_resp_dto.dart';
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

// user 위한 유저 정보
  Future<ResponseDto> fetchGetUserDetailMyPage(int userId) async {
    Response response = await httpConnector.get(path: "/api/user/$userId/mypage");
    ResponseDto responseDto = toResponseDto(response);
    if (responseDto.data != null) {
      responseDto.data = UserPageRespDto.fromJson(responseDto.data);
    }
    return responseDto;
  }

// master 위한 유저 정보
  Future<ResponseDto> fetchGetMasterDetailMyPage(int userId) async {
    Response response = await httpConnector.get(path: "/api/expert/$userId/mypage");
    ResponseDto responseDto = toResponseDto(response);
    if (responseDto.data != null) {
      responseDto.data = MasterPageRespDto.fromJson(responseDto.data);
    }
    return responseDto;
  }

//프로필 정보
  Future<ResponseDto> fetchGetDetailProfile(int userId) async {
    Response response = await httpConnector.get(path: "/api/user/${userId}/profile");
    ResponseDto responseDto = toResponseDto(response);
    if (responseDto.data != null) {
      responseDto.data = ProfileDetailRespDto.fromJson(responseDto.data);
    }
    return responseDto;
  }

  //마스터 판매자 리스트
  Future<ResponseDto> fetchSellingList(int userId, String? jwtToken) async {
    Response response = await httpConnector.get(path: "/api/expert/${userId}/sellingList");
    ResponseDto responseDto = toResponseDto(response);
    if (responseDto.data != null) {
      responseDto.data = SellingListRespDto.fromJson(responseDto.data);
    }
    return responseDto;
  }

  //구매자리스트
  Future<ResponseDto> fetchBuyingList(int userId, String? jwtToken) async {
    Response response = await httpConnector.get(path: "/api/user/${userId}/buyingList");
    ResponseDto responseDto = toResponseDto(response);
    if (responseDto.data != null) {
      responseDto.data = buyingListRespDto.fromJson(responseDto.data);
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
    }
    return responseDto;
  }

  Future<ResponseDto> fetchUpdateProfile(int userId, ProfileUpdateReqDto profileUpdateReqDto) async {
    String requestBody = jsonEncode(profileUpdateReqDto);

    Response response = await httpConnector.put(path: "/api/user/$userId/profile", body: requestBody);
    ResponseDto responseDto = toResponseDto(response);

    return responseDto;
  }

  Future<ResponseDto> fetchInsertProfile(ProfileInsertReqDto profileInsertReqDto) async {
    String requestBody = jsonEncode(profileInsertReqDto);

    Response response = await httpConnector.post(path: "/api/profile", body: requestBody);
    ResponseDto responseDto = toResponseDto(response);

    return responseDto;
  }

  Future<ResponseDto> fetchDeleteUser(userId) async {
    Response response = await httpConnector.put(path: "/api/user/$userId/delete");
    ResponseDto responseDto = toResponseDto(response);
    return responseDto;
  }
}
