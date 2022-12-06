// ignore: slash_for_doc_comments

import 'package:finalproject_front/domain/user/user_http_repository.dart';
import 'package:finalproject_front/dto/response/respone_dto.dart';
import 'package:finalproject_front/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dto/request/user_req_dto.dart';

/**
 * Controller은 비즈니스 로직을 담당
 * Page에서 컨트롤러 사용위한 싱글톤 Provider 사용
 * Page가 Controller만 리스닝함.
 */
final userController = Provider<UserController>((ref) {
  final userHttpRepositoryPS =
      ref.read(userHttpRepository); // 컨트롤러 + Repository
  return UserController(ref);
});

class UserController {
  final context =
      navigatorKey.currentContext!; // 모든 컨트롤러가 필요 왜? 어떤 페이지인지 알아야하기 때문
  final Ref _ref;
  UserController(this._ref);

  void join(UserReqDto userReqDto) async {
    ResponseDto respDto = await _ref.read(userHttpRepository).join(userReqDto);
  }
}
