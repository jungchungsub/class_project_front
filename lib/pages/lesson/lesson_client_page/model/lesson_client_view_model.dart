import 'package:finalproject_front/main.dart';
import 'package:finalproject_front/pages/lesson/lesson_client_page/model/lesson_client_model.dart';
import 'package:finalproject_front/service/user_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:finalproject_front/domain/user_session.dart';
import 'package:finalproject_front/dto/response/respone_dto.dart';

final lessonClientListViewModel = StateNotifierProvider.family.autoDispose<LessonClientListViewModel, LessonClientListModel?, int>(
  (ref, userId) {
    return LessonClientListViewModel(null, userId)..notifyViewModel();
  },
);

class LessonClientListViewModel extends StateNotifier<LessonClientListModel?> {
  final UserService userService = UserService();

  final int userId;
  final mContext = navigatorKey.currentContext;

  LessonClientListViewModel(super.state, this.userId);

  Future<void> notifyViewModel() async {
    String? jwtToken;
    ResponseDto responseDto = await userService.fetchBuyingList(userId, UserSession.jwtToken);
    if (responseDto.statusCode < 300) {
      LessonClientListModel model = LessonClientListModel(responseDto.data);

      state = model;
    }
  }
}
