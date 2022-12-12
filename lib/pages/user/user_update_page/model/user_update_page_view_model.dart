// // autoDispose 를 안해주면, 다른 아이디로 재로그인 했을 때, ViewModel이 살아있어서 데이터를 이전 것을 가져온다.
// import 'package:finalproject_front/domain/user/user_http_repository.dart';
// import 'package:finalproject_front/pages/user/user_update_page/model/user_update_page_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:logger/logger.dart';

// import '../../../../dto/response/respone_dto.dart';
// import '../../../../main.dart';
// import '../../user_session/user_session.dart';

// final userUpdatePageViewModel = StateNotifierProvider.autoDispose<UserUpdatePageViewModel, UserUpdatePageModel?>((ref) {
//   return UserUpdatePageViewModel(null)..initViewModel();
// });

// class UserUpdatePageViewModel extends StateNotifier<UserUpdatePageModel?> {

//   final UserHttpRepository userService = UserHttpRepository();
//   final gContext = navigatorKey.currentContext;
//   UserUpdatePageViewModel(super.state);

//   Future<void> initViewModel() async {
//     Logger().d("user id : ${UserSession.user!.id}");
//     ResponseDto responseDto = await userService.fetchUserInfo(UserSession.user!.id);
//     if (responseDto.statusCode > 0 || responseDto.statusCode < 500) {
//       state = UserUpdatePageModel(responseDto.data);
//     } else {
//       ScaffoldMessenger.of(mContext!).showSnackBar(
//         const SnackBar(content: Text("잘못된 요청입니다.")),
//       );
//     }
//   }
// }
