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
