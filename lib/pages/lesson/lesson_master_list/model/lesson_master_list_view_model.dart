import 'package:finalproject_front/dto/response/respone_dto.dart';
import 'package:finalproject_front/main.dart';
import 'package:finalproject_front/pages/lesson/lesson_master_list/model/lesson_master_list_model.dart';
import 'package:finalproject_front/service/user_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:finalproject_front/domain/user_session.dart';

final lessonMasterListViewModel = StateNotifierProvider.family.autoDispose<LessonMasterListViewModel, LessonMasterListModel?, int>(
  (ref, userId) {
    return LessonMasterListViewModel(null, userId)..notifyViewModel();
  },
);

class LessonMasterListViewModel extends StateNotifier<LessonMasterListModel?> {
  final UserService userService = UserService();

  final int userId;
  final mContext = navigatorKey.currentContext;

  LessonMasterListViewModel(super.state, this.userId);

  Future<void> notifyViewModel() async {
    String? jwtToken;
    ResponseDto responseDto = await userService.fetchSellingList(userId, UserSession.jwtToken);
    if (responseDto.statusCode < 300) {
      LessonMasterListModel model = LessonMasterListModel(responseDto.data);

      state = model;
    }
  }
}
