import 'package:finalproject_front/domain/user/user_http_repository.dart';
import 'package:finalproject_front/dto/response/respone_dto.dart';
import 'package:finalproject_front/main.dart';
import 'package:finalproject_front/pages/auth/join_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dto/request/auth_req_dto.dart';

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

  void join(String username, String password, String email, String phoneNum, String role) async {
    JoinReqDto joinReqDto = JoinReqDto(username: username, password: password, email: email, phoneNum: phoneNum, role: role);

    ResponseDto respDto = await _ref.read(userHttpRepository).join(joinReqDto);
    // // 3. 비지니스 로직 처리
    // if (respDto.status == 200) {
    //   User user = User.fromJson(respDto.data);
    //   print("가입된 유저 이름 : ${user.username}");
    //   Navigator.popAndPushNamed(context, "/login");
    //   // 4. 응답된 데이터를 ViewModel에 반영해야 한다면 통신 성공시에 추가하기
    // } else {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(content: Text("회원가입 실패")),
    //   );
  }
}
