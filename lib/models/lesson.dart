import 'package:finalproject_front/models/review.dart';

class Lesson {
  int id;
  String lessonName;
  int lessonPrice;
  int lessonTime;
  int lessonCount;
  String lessonPlace;
  String possibleDays;
  String lessonPolicy;
  String masterName;
  String masterImage;
  String masterIntroduction;
  List reviewTotal;

  Lesson({
    required this.id,
    required this.lessonName,
    required this.lessonPrice,
    required this.lessonTime,
    required this.lessonCount,
    required this.lessonPlace,
    required this.possibleDays,
    required this.lessonPolicy,
    required this.masterName,
    required this.masterImage,
    required this.masterIntroduction,
    required this.reviewTotal,
  });
}

List<Lesson> lessonList = [
  Lesson(
    id: 1,
    lessonName: "내 몸 상태 바로 알기 내몸에 꼭맞는 운동 테스트",
    lessonPrice: 50001,
    lessonTime: 108,
    lessonCount: 12,
    lessonPlace: "부산관역시 부산진구 홍길동",
    possibleDays: "월요일",
    lessonPolicy:
        "취소 및 환불을 하면 솰라솰라 10회 피티 이용제한이 생기면서 한국 중국 러시아 일본 베트남 말레시아 영국 미국 북한 필리핀 브라질",
    masterImage: "https://picsum.photos/201",
    masterName: "김동진",
    masterIntroduction: "한국대학교 경호학과 졸업, 다수 대회에서 수상경력 있습니다.",
    reviewTotal: [
      Review(
          id: 1,
          username: "정충섭",
          reviewContent: "처음에는 긴가민가했는데 꾸준히 수업을 들어 보니 엄청 좋았습니다."),
      Review(
          id: 2,
          username: "아이유",
          reviewContent: "마지막에는 긴가민가했는데 꾸준히 수업을 들어 보니 엄청 좋았습니다."),
      Review(
          id: 3,
          username: "이현성",
          reviewContent: "끝에는 긴가민가했는데 꾸준히 수업을 들어 보니 엄청 좋았습니다."),
      Review(
          id: 4,
          username: "수지",
          reviewContent: "나무에는 긴가민가했는데 꾸준히 수업을 들어 보니 엄청 좋았습니다.")
    ],
  ),
];
