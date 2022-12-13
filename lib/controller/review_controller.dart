import 'package:finalproject_front/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final lessonController = Provider<LessonController>((ref) {
  // Controller + HttpRepo
  return LessonController(ref);
});

class LessonController {
  final context = navigatorKey.currentContext!;
  Ref _ref;
  LessonController(this._ref);
}
