class Lesson {
  int id;
  String lessonCategory;
  String lessonTitle;
  int lessonReview;
  String lessonPrice;
  String currriculum;
  String lessonTime;
  String lessonCount;
  String lessonPlace;
  String lessonCancel;
  String expertName;
  String expertContent;
  double evaluation;
  double totalReview;

  Lesson(
      {required this.id,
      required this.lessonCategory,
      required this.lessonTitle,
      required this.lessonReview,
      required this.lessonPrice,
      required this.currriculum,
      required this.lessonTime,
      required this.lessonCount,
      required this.lessonPlace,
      required this.lessonCancel,
      required this.expertName,
      required this.expertContent,
      required this.evaluation,
      required this.totalReview});
}

List<Lesson> lessonList = [
  Lesson(
    id: 1,
    lessonCategory: "뷰티aaa・운동",
    lessonTitle: "테스테스트테스트중입니다",
    lessonReview: 16,
    lessonPrice: "50,000",
    currriculum: "간단한 서비스에 대한 설명들",
    lessonTime: "108분",
    lessonCount: "10회",
    lessonPlace: "부산관역시 부산진구 홍길동",
    lessonCancel:
        "취소 및 환불을 하면 솰라솰라 10회 피티 이용제한이 생기면서 한국 중국 러시아 일본 베트남 말레시아 영국 미국 북한 필리핀 브라질",
    expertName: "김동진",
    expertContent: "한국대학교 경호학과 졸업, 다수 대회에서 수상경력 있습니다.",
    evaluation: 4.6,
    totalReview: 124,
  ),
];
