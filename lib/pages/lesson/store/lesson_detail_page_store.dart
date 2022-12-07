import 'package:finalproject_front/domain/lesson/lesson_http_repository.dart';
import 'package:finalproject_front/dto/response/lesson_resp_dto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final lessonDetailPageStore = StateNotifierProvider<LessonDetailPageStore, dynamic>((ref) {
  int id = 1; // ??에러 때문에 임의 생성
  return LessonDetailPageStore(ref)..initViewModel(id);
});

class LessonDetailPageStore extends StateNotifier<dynamic> {
  Ref _ref;
  LessonDetailPageStore(this._ref) : super(dynamic);
  void initViewModel(int id) async {
    LessonRespDto lessonRespDto = await _ref.read(lessonHttprepository).getLessonDetail(id);
    state = lessonRespDto;
  }
}

// LessonRespDto lesson = LessonRespDto(
//       lessonName: "내 몸 상태 바로 알기 내몸에 꼭맞는 운동 테스트",
//       lessonPrice: 50000,
//       lessonTime: 110,
//       lessonCount: 13,
//       lessonPlace: "부산관역시 부산진구 홍길동",
//       possibleDays: "월요일",
//       lessonPolicy: "취소 및 환불을 하면 솰라솰라 10회 피티 이용제한이 생기면서 한국 중국 러시아 일본 베트남 말레시아 영국 미국 북한 필리핀 브라질",
//       masterImg: "https://picsum.photos/200",
//       masterName: "김동진",
//       masterIntroduction: "한국대학교 경호학과 졸업, 다수 대회에서 수상경력 있습니다.",
//       lessonReviewList:
//           List<ReviewRespDto>.generate(5, (index) => ReviewRespDto(username: "아이유", reviewContent: "ㅎㅇ", lessonGrade: 4.5), growable: true));