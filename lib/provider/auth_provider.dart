// import 'package:finalproject_front/dto/response/profile_resp_dto.dart';
// import 'package:finalproject_front/models/lesson_detail_resp_dto.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// final authProvider = StateNotifierProvider<AuthProvider, ProfileDetailRespDto>((ref) {
//   return AuthProvider(ref)..initJwtToken(); // 누군가 AuthProvider를 사용할때 initJwtToken이 실행됨
// });

// class AuthProvider extends StateNotifier<ProfileDetailRespDto> {
//   // 어디에서나 접근을 할 수 있는 데이터
//   // 전역으로 관리 할 것들.
//   String? jwtToken;
//   bool isLogin = false;
//   Ref _ref;

//   ProfileDetailRespDto profileDetailRespDto;
//   AuthProvider(this._ref) : super(ProfileDetailRespDto);
//   Future<void> initJwtToken() async {
//     final prefs = await SharedPreferences.getInstance();
//     final deviceJwtToken = prefs.getString("jwtToken");
//     if (deviceJwtToken != null) {
//       isLogin = true;
//       jwtToken = deviceJwtToken;
//       // 통신 코드 user 초기화 시켜주는 코드
//       // http://ip주소:8080/userData(Get, Header:jwtToken) - 유저 정보 필요해서임. 위쪽에 User? user;
//       // 만약 전역 Provider에 유저 정보가 필요 없으면 안써도됨.
//     }
//   }
// }
