import 'package:finalproject_front/dto/response/respone_dto.dart';
import 'package:finalproject_front/main.dart';
import 'package:finalproject_front/pages/main/home/home_page/model/home_page_model.dart';
import 'package:finalproject_front/service/lesson_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

final homePageViewModel = StateNotifierProvider.autoDispose<HomePageViewModel, HomePageModel?>(((ref) {
  return HomePageViewModel(null)..notifyViewModel();
}));

class HomePageViewModel extends StateNotifier<HomePageModel?> {
  final LessonService lessonService = LessonService();
  final mContext = navigatorKey.currentContext;
  HomePageViewModel(super.state);

  Future<void> notifyViewModel() async {
    ResponseDto responseDto = await lessonService.fetchHomeList();
    if (responseDto.statusCode < 300) {
      state = HomePageModel(responseDto.data);
    }
  }
}


// final homePageViewModel =
//     StateNotifierProvider.autoDispose<HomePageViewModel, HomePageModel?>((ref) {
//   return HomePageViewModel(null)..notifyViewModel();
// });

// class HomePageViewModel extends StateNotifier<HomePageModel?> {
//   final PostService postService = PostService();
//   final mContext = navigatorKey.currentContext;
//   HomePageViewModel(super.state);

//   Future<void> notifyViewModel() async {
//     ResponseDto responseDto = await postService.fetchPostList();
//     if (responseDto.code == 1) {
//       state = HomePageModel(responseDto.data);
//     } else {
//       ScaffoldMessenger.of(mContext!).showSnackBar(
//         const SnackBar(content: Text("Jwt 토큰이 만료되었습니다. 로그인 페이지로 이동합니다.")),
//       );
//       Future.delayed(const Duration(seconds: 1), () {
//         Navigator.pushNamedAndRemoveUntil(
//             mContext!, Move.loginPage, (route) => false);
//       });
//     }
//   }