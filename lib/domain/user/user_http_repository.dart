import 'dart:convert';

import 'package:finalproject_front/domain/http_connector.dart';
import 'package:finalproject_front/dto/request/auth_req_dto.dart';
import 'package:finalproject_front/dto/response/respone_dto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

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
}
