import 'package:finalproject_front/domain/user_session.dart';
import 'package:finalproject_front/dto/response/respone_dto.dart';
import 'package:finalproject_front/dto/response/review_resp_dto.dart';
import 'package:finalproject_front/main.dart';
import 'package:finalproject_front/pages/lesson/lesson_detail_page/model/lesson_detail_page_model.dart';
import 'package:finalproject_front/service/lesson_service.dart';
import 'package:finalproject_front/dto/response/lesson_resp_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

// final lessonDetailPageStore = StateNotifierProvider.family<LessonDetailPageStore, LessonRespDto?, int>((ref, id) {
//   return LessonDetailPageStore(null, ref)..initViewModel(id);
// });

//LessonDetailPageModel? 이페이지가 관리하는 상태

final lessonDetailPageViewModel = StateNotifierProvider.family.autoDispose<LessonDetailPageViewModel, LessonDetailPageModel?, int>((ref, lessonId) {
  ref.onDispose(() {
    Logger().d("LessonDetailPageViewModel 삭제됨");
  });
  return LessonDetailPageViewModel(null, lessonId)..notifyViewModel();
});

//view의 데이터를 가짐
class LessonDetailPageViewModel extends StateNotifier<LessonDetailPageModel?> {
  final LessonService lessonService = LessonService();
  final int lessonId;
  final mContext = navigatorKey.currentContext;
  LessonDetailPageViewModel(super.state, this.lessonId);

  Future<void> notifyViewModel() async {
    ResponseDto responseDto = await lessonService.getLessonDetail(lessonId, UserSession.jwtToken);

    Logger().d(responseDto.data);
    if (responseDto.statusCode < 300) {
      LessonDetailPageModel model = LessonDetailPageModel(responseDto.data);

      state = model;
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        const SnackBar(content: Text("잘못된 요청입니다")),
      );
    }
  }

  // void notifyUpdate(LessonRespDto lessonRespDto) {
  //   state = LessonDetailPageModel(lessonRespDto);
  // }
}
// }
// Logger().d("lesson확인 : ${lessonRespDto.toString()}");
// state = lessonRespDto;

//   void refresh(List<LessonRespDto> lessonRespDto) {
//     state = lessonRespDto;
//   }
// }
