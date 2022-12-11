import 'package:finalproject_front/domain/lesson/lesson_http_repository.dart';
import 'package:finalproject_front/dto/response/lesson_resp_dto.dart';
import 'package:finalproject_front/pages/lesson/lesson_detail_page/lesson_detail_page.dart';
import 'package:finalproject_front/pages/main/home/home_page.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

// final lessonDetailPageStore = StateNotifierProvider.family<LessonDetailPageStore, LessonRespDto?, int>((ref, id) {
//   return LessonDetailPageStore(null, ref)..initViewModel(id);
// });

// final lessonDetailPageStore = StateNotifierProvider<LessonDetailPageModel, LessonRespDto>((ref) {
//   //return LessonDetailPageModel( ,ref)..initViewModel();
// });

class LessonDetailPageModel extends StateNotifier<LessonRespDto> {
  Ref _ref;
  LessonDetailPageModel(super.state, this._ref);

  //LoginStateNotifier():super(LoginState.none);

  //LessonDetailPageModel(this._ref) :super(stat);

  //LessonDetailPageModel():super(super.state);

  //http 처음 초기화
  void initViewModel() async {
    LessonRespDto lessonRespDto = await _ref.read(lessonHttprepository).getLessonDetail(1);
    state = lessonRespDto;
  }

  void refresh(LessonRespDto lessonRespDto) {
    state = lessonRespDto;
  }
}
