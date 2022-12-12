import 'package:finalproject_front/service/lesson_service.dart';
import 'package:finalproject_front/dto/response/lesson_resp_dto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

// final lessonDetailPageStore = StateNotifierProvider.family<LessonDetailPageStore, LessonRespDto?, int>((ref, id) {
//   return LessonDetailPageStore(null, ref)..initViewModel(id);
// });

final lessonDetailPageStore = StateNotifierProvider.autoDispose<LessonDetailPageModel, List<LessonRespDto>>((ref) {
  return LessonDetailPageModel([], ref)..initViewModel();
});

class LessonDetailPageModel extends StateNotifier<List<LessonRespDto>> {
  Ref _ref;
  LessonDetailPageModel(super.state, this._ref);

  void initViewModel() async {
    Logger().d("실행");
    List<LessonRespDto> lessonRespDto = await LessonService().getLessonDetail(3);
    Logger().d("lesson확인 : ${lessonRespDto.toString()}");
    state = lessonRespDto;
  }

  void refresh(List<LessonRespDto> lessonRespDto) {
    state = lessonRespDto;
  }
}
