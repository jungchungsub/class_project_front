import 'package:finalproject_front/domain/lesson/lesson_http_repository.dart';
import 'package:finalproject_front/dto/response/lesson_resp_dto.dart';
import 'package:finalproject_front/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final lessonController = Provider<LessonController>(((ref) {
  final LessonHttpRepositoryPS = ref.read(lessonHttprepository); // Controller + HttpRepo
  return LessonController(ref);
}));

class LessonController {
  final context = navigatorKey.currentContext!;

  Ref _ref;

  LessonController(this._ref);

// 절대 리턴 하지 말기
  Future<void> getLessonDetail(int id) async {
    Logger().d("실행됨?");
    List<LessonRespDto> lessonPS = await _ref.read(lessonHttprepository).getLessonDetail(id); // 가져온 값을 lessonRespDto에 저장
  }
}
