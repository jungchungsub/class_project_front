import 'package:finalproject_front/service/user_service.dart';
import 'package:finalproject_front/dto/response/user_resp_dto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 회원가입이 pageStore가 필요한가..?
// final joinPageStore = StateNotifierProvider<JoinPageStore, UserRespDto>((ref) {
//   return JoinPageStore(ref);
// });

// class JoinPageStore extends StateNotifier<UserRespDto> {
//   Ref _ref;
//   JoinPageStore(this._ref);

//   void initViewModel() async {
//     UserRespDto user = await _ref.read(userHttpRepository).findAll();
//     state = user;
//   }
// }
