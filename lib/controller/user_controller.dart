import 'package:finalproject_front/domain/user/user_http_repository.dart';
import 'package:finalproject_front/dto/response/respone_dto.dart';
import 'package:finalproject_front/main.dart';
import 'package:finalproject_front/pages/sign/join_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

import '../dto/request/auth_req_dto.dart';
import '../util/custom_alert_dialog.dart';

/**
 * Controller은 비즈니스 로직을 담당
 * Page에서 컨트롤러 사용위한 싱글톤 Provider 사용
 * Page가 Controller만 리스닝함.
 */
final userController = Provider<UserController>((ref) {
  final userHttpRepositoryPS = ref.read(userHttpRepository); // 컨트롤러 + Repository
  return UserController(ref);
});

class UserController {
  final context = navigatorKey.currentContext!; // 모든 컨트롤러가 필요 왜? 어떤 페이지인지 알아야하기 때문
  final Ref _ref;
  UserController(this._ref);

  void joinDivisionButton(String role) {
    if (role == "USER") {
      Navigator.push(context, MaterialPageRoute(builder: (context) => JoinPage(role: role)));
    }
    if (role == "MASTER") {
      Navigator.push(context, MaterialPageRoute(builder: (context) => JoinPage(role: role)));
    }
  }

  void join({required String username, required String password, required String email, required String phoneNum, required String role}) async {
    JoinReqDto joinReqDto = JoinReqDto(username: username, password: password, email: email, phoneNum: phoneNum, role: role);

    ResponseDto respDto = await _ref.read(userHttpRepository).join(joinReqDto);
    if (respDto.statusCode == 201) {
      Navigator.popAndPushNamed(context, "/login");
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("회원가입 실패")),
      );
    }
  }

  Future<void> login({required String username, required String password}) async {
    // 1. DTO 변환
    LoginReqDto loginReqDto = LoginReqDto(username: username, password: password);

    // 2. 통신 요청
    ResponseDto respDto = await _ref.read(userHttpRepository).login(loginReqDto);
    //3. 비지니스 로직 처리
    if (respDto.statusCode > 200 || respDto.statusCode < 300) {
      Navigator.of(navigatorKey.currentContext!).pushNamedAndRemoveUntil("/main", (route) => false);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("로그인 실패")),
      );
    }
  }
}
