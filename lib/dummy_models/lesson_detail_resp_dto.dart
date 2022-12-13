import 'package:finalproject_front/dummy_models/review.dart';

class Lesson {
  int id;
  String lessonImage;
  String lessonName;
  int lessonPrice;
  int lessonTime;
  int lessonCount;

  String lessonCurriculum;
  String lessonPlace;
  String possibleDays;
  String lessonPolicy;
  String masterName;
  int totalReview;
  ProfileDto profileDto;
  List<ReviewDto> reviewDtoList;

  Lesson({
    required this.id,
    required this.lessonImage,
    required this.lessonName,
    required this.lessonPrice,
    required this.lessonTime,
    required this.lessonCount,
    required this.lessonCurriculum,
    required this.lessonPlace,
    required this.possibleDays,
    required this.lessonPolicy,
    required this.masterName,
    required this.totalReview,
    required this.profileDto,
    required this.reviewDtoList,
  });
}

class ReviewDto {
  int id;
  String username;
  String reviewContent;
  double lessonGrade;

  ReviewDto({
    required this.id,
    required this.username,
    required this.reviewContent,
    required this.lessonGrade,
  });
}

class ProfileDto {
  int id;
  String masterImage;
  String masterIntroduction;

  ProfileDto({
    required this.id,
    required this.masterImage,
    required this.masterIntroduction,
  });
}

List<Lesson> lessonList = [
  Lesson(
      id: 1,
      lessonName: "내 몸 상태 바로 알기 내몸에 꼭맞는 운동 테스트",
      lessonPrice: 50001,
      lessonTime: 108,
      lessonCount: 12,
      lessonImage: "https://picsum.photos/101",
      lessonCurriculum: "간단한 커리큘럼이 있습니다아.",
      lessonPlace: "부산관역시 부산진구 홍길동",
      possibleDays: "월요일",
      lessonPolicy: "취소 및 환불을 하면 솰라솰라 10회 피티 이용제한이 생기면서 한국 중국 러시아 일본 베트남 말레시아 영국 미국 북한 필리핀 브라질",
      profileDto: ProfileDto(id: 1, masterImage: "https://picsum.photos/201", masterIntroduction: "한국대학교 경호학과 졸업, 다수 대회에서 수상경력 있습니다."),
      masterName: "김동진",
      totalReview: 50,
      reviewDtoList: [
        ReviewDto(id: 1, username: "이현성", reviewContent: "너무좋았어요", lessonGrade: 3.5),
        ReviewDto(id: 2, username: "박지성", reviewContent: "너무좋습니다아아아", lessonGrade: 2.5),
        ReviewDto(id: 3, username: "정충섭", reviewContent: "다음에도 구매할것 같아요", lessonGrade: 4.5),
      ]),
  Lesson(
      id: 2,
      lessonName: "내 몸 상태 바로 알기 내몸에 꼭맞는 운동 테스트",
      lessonPrice: 50001,
      lessonTime: 108,
      lessonCount: 12,
      lessonImage: "https://picsum.photos/102",
      lessonCurriculum: "간단한 커리큘럼이 있습니다아.",
      lessonPlace: "부산관역시 부산진구 홍길동",
      possibleDays: "월요일",
      lessonPolicy: "취소 및 환불을 하면 솰라솰라 10회 피티 이용제한이 생기면서 한국 중국 러시아 일본 베트남 말레시아 영국 미국 북한 필리핀 브라질",
      profileDto: ProfileDto(id: 1, masterImage: "https://picsum.photos/202", masterIntroduction: "한국대학교 경호학과 졸업, 다수 대회에서 수상경력 있습니다."),
      masterName: "김동진",
      totalReview: 50,
      reviewDtoList: [
        ReviewDto(id: 1, username: "이현성", reviewContent: "너무좋았어요", lessonGrade: 3.5),
        ReviewDto(id: 2, username: "박지성", reviewContent: "너무좋습니다아아아", lessonGrade: 2.5),
        ReviewDto(id: 3, username: "정충섭", reviewContent: "다음에도 구매할것 같아요", lessonGrade: 4.5),
      ]),
  Lesson(
      id: 3,
      lessonName: "내 몸 상태 바로 알기 내몸에 꼭맞는 운동 테스트",
      lessonPrice: 50001,
      lessonTime: 108,
      lessonCount: 12,
      lessonImage: "https://picsum.photos/103",
      lessonCurriculum: "간단한 커리큘럼이 있습니다아.",
      lessonPlace: "부산관역시 부산진구 홍길동",
      possibleDays: "월요일",
      lessonPolicy: "취소 및 환불을 하면 솰라솰라 10회 피티 이용제한이 생기면서 한국 중국 러시아 일본 베트남 말레시아 영국 미국 북한 필리핀 브라질",
      profileDto: ProfileDto(id: 1, masterImage: "https://picsum.photos/203", masterIntroduction: "한국대학교 경호학과 졸업, 다수 대회에서 수상경력 있습니다."),
      masterName: "김동진",
      totalReview: 50,
      reviewDtoList: [
        ReviewDto(id: 1, username: "이현성", reviewContent: "너무좋았어요", lessonGrade: 3.5),
        ReviewDto(id: 2, username: "박지성", reviewContent: "너무좋습니다아아아", lessonGrade: 2.5),
        ReviewDto(id: 3, username: "정충섭", reviewContent: "다음에도 구매할것 같아요", lessonGrade: 4.5),
      ]),
  Lesson(
      id: 4,
      lessonName: "내 몸 상태 바로 알기 내몸에 꼭맞는 운동 테스트",
      lessonPrice: 50001,
      lessonTime: 108,
      lessonCount: 12,
      lessonImage: "https://picsum.photos/104",
      lessonCurriculum: "간단한 커리큘럼이 있습니다아.",
      lessonPlace: "부산관역시 부산진구 홍길동",
      possibleDays: "월요일",
      lessonPolicy: "취소 및 환불을 하면 솰라솰라 10회 피티 이용제한이 생기면서 한국 중국 러시아 일본 베트남 말레시아 영국 미국 북한 필리핀 브라질",
      profileDto: ProfileDto(id: 1, masterImage: "https://picsum.photos/204", masterIntroduction: "한국대학교 경호학과 졸업, 다수 대회에서 수상경력 있습니다."),
      masterName: "김동진",
      totalReview: 50,
      reviewDtoList: [
        ReviewDto(id: 1, username: "이현성", reviewContent: "너무좋았어요", lessonGrade: 3.5),
        ReviewDto(id: 2, username: "박지성", reviewContent: "너무좋습니다아아아", lessonGrade: 2.5),
        ReviewDto(id: 3, username: "정충섭", reviewContent: "다음에도 구매할것 같아요", lessonGrade: 4.5),
      ]),
  Lesson(
      id: 5,
      lessonName: "내 몸 상태 바로 알기 내몸에 꼭맞는 운동 테스트",
      lessonPrice: 50001,
      lessonTime: 108,
      lessonCount: 12,
      lessonImage: "https://picsum.photos/105",
      lessonCurriculum: "간단한 커리큘럼이 있습니다아.",
      lessonPlace: "부산관역시 부산진구 홍길동",
      possibleDays: "월요일",
      lessonPolicy: "취소 및 환불을 하면 솰라솰라 10회 피티 이용제한이 생기면서 한국 중국 러시아 일본 베트남 말레시아 영국 미국 북한 필리핀 브라질",
      profileDto: ProfileDto(id: 1, masterImage: "https://picsum.photos/205", masterIntroduction: "한국대학교 경호학과 졸업, 다수 대회에서 수상경력 있습니다."),
      masterName: "김동진",
      totalReview: 50,
      reviewDtoList: [
        ReviewDto(id: 1, username: "이현성", reviewContent: "너무좋았어요", lessonGrade: 3.5),
        ReviewDto(id: 2, username: "박지성", reviewContent: "너무좋습니다아아아", lessonGrade: 2.5),
        ReviewDto(id: 3, username: "정충섭", reviewContent: "다음에도 구매할것 같아요", lessonGrade: 4.5),
      ]),
  Lesson(
      id: 6,
      lessonName: "내 몸 상태 바로 알기 내몸에 꼭맞는 운동 테스트",
      lessonPrice: 50001,
      lessonTime: 108,
      lessonCount: 12,
      lessonImage: "https://picsum.photos/106",
      lessonCurriculum: "간단한 커리큘럼이 있습니다아.",
      lessonPlace: "부산관역시 부산진구 홍길동",
      possibleDays: "월요일",
      lessonPolicy: "취소 및 환불을 하면 솰라솰라 10회 피티 이용제한이 생기면서 한국 중국 러시아 일본 베트남 말레시아 영국 미국 북한 필리핀 브라질",
      profileDto: ProfileDto(id: 1, masterImage: "https://picsum.photos/206", masterIntroduction: "한국대학교 경호학과 졸업, 다수 대회에서 수상경력 있습니다."),
      masterName: "김동진",
      totalReview: 50,
      reviewDtoList: [
        ReviewDto(id: 1, username: "이현성", reviewContent: "너무좋았어요", lessonGrade: 3.5),
        ReviewDto(id: 2, username: "박지성", reviewContent: "너무좋습니다아아아", lessonGrade: 2.5),
        ReviewDto(id: 3, username: "정충섭", reviewContent: "다음에도 구매할것 같아요", lessonGrade: 4.5),
      ]),
  Lesson(
      id: 7,
      lessonName: "내 몸 상태 바로 알기 내몸에 꼭맞는 운동 테스트",
      lessonPrice: 50001,
      lessonTime: 108,
      lessonCount: 12,
      lessonImage: "https://picsum.photos/107",
      lessonCurriculum: "간단한 커리큘럼이 있습니다아.",
      lessonPlace: "부산관역시 부산진구 홍길동",
      possibleDays: "월요일",
      lessonPolicy: "취소 및 환불을 하면 솰라솰라 10회 피티 이용제한이 생기면서 한국 중국 러시아 일본 베트남 말레시아 영국 미국 북한 필리핀 브라질",
      profileDto: ProfileDto(id: 1, masterImage: "https://picsum.photos/207", masterIntroduction: "한국대학교 경호학과 졸업, 다수 대회에서 수상경력 있습니다."),
      masterName: "김동진",
      totalReview: 50,
      reviewDtoList: [
        ReviewDto(id: 1, username: "이현성", reviewContent: "너무좋았어요", lessonGrade: 3.5),
        ReviewDto(id: 2, username: "박지성", reviewContent: "너무좋습니다아아아", lessonGrade: 2.5),
        ReviewDto(id: 3, username: "정충섭", reviewContent: "다음에도 구매할것 같아요", lessonGrade: 4.5),
      ]),
  Lesson(
      id: 8,
      lessonName: "내 몸 상태 바로 알기 내몸에 꼭맞는 운동 테스트",
      lessonPrice: 50001,
      lessonTime: 108,
      lessonCount: 12,
      lessonImage: "https://picsum.photos/108",
      lessonCurriculum: "간단한 커리큘럼이 있습니다아.",
      lessonPlace: "부산관역시 부산진구 홍길동",
      possibleDays: "월요일",
      lessonPolicy: "취소 및 환불을 하면 솰라솰라 10회 피티 이용제한이 생기면서 한국 중국 러시아 일본 베트남 말레시아 영국 미국 북한 필리핀 브라질",
      profileDto: ProfileDto(id: 1, masterImage: "https://picsum.photos/208", masterIntroduction: "한국대학교 경호학과 졸업, 다수 대회에서 수상경력 있습니다."),
      masterName: "김동진",
      totalReview: 50,
      reviewDtoList: [
        ReviewDto(id: 1, username: "이현성", reviewContent: "너무좋았어요", lessonGrade: 3.5),
        ReviewDto(id: 2, username: "박지성", reviewContent: "너무좋습니다아아아", lessonGrade: 2.5),
        ReviewDto(id: 3, username: "정충섭", reviewContent: "다음에도 구매할것 같아요", lessonGrade: 4.5),
      ]),
  Lesson(
      id: 9,
      lessonName: "내 몸 상태 바로 알기 내몸에 꼭맞는 운동 테스트",
      lessonPrice: 50001,
      lessonTime: 108,
      lessonCount: 12,
      lessonImage: "https://picsum.photos/109",
      lessonCurriculum: "간단한 커리큘럼이 있습니다아.",
      lessonPlace: "부산관역시 부산진구 홍길동",
      possibleDays: "월요일",
      lessonPolicy: "취소 및 환불을 하면 솰라솰라 10회 피티 이용제한이 생기면서 한국 중국 러시아 일본 베트남 말레시아 영국 미국 북한 필리핀 브라질",
      profileDto: ProfileDto(id: 1, masterImage: "https://picsum.photos/209", masterIntroduction: "한국대학교 경호학과 졸업, 다수 대회에서 수상경력 있습니다."),
      masterName: "김동진",
      totalReview: 50,
      reviewDtoList: [
        ReviewDto(id: 1, username: "이현성", reviewContent: "너무좋았어요", lessonGrade: 3.5),
        ReviewDto(id: 2, username: "박지성", reviewContent: "너무좋습니다아아아", lessonGrade: 2.5),
        ReviewDto(id: 3, username: "정충섭", reviewContent: "다음에도 구매할것 같아요", lessonGrade: 4.5),
      ]),
  Lesson(
      id: 10,
      lessonName: "내 몸 상태 바로 알기 내몸에 꼭맞는 운동 테스트",
      lessonPrice: 50001,
      lessonTime: 108,
      lessonCount: 12,
      lessonImage: "https://picsum.photos/110",
      lessonCurriculum: "간단한 커리큘럼이 있습니다아.",
      lessonPlace: "부산관역시 부산진구 홍길동",
      possibleDays: "월요일",
      lessonPolicy: "취소 및 환불을 하면 솰라솰라 10회 피티 이용제한이 생기면서 한국 중국 러시아 일본 베트남 말레시아 영국 미국 북한 필리핀 브라질",
      profileDto: ProfileDto(id: 1, masterImage: "https://picsum.photos/210", masterIntroduction: "한국대학교 경호학과 졸업, 다수 대회에서 수상경력 있습니다."),
      masterName: "김동진",
      totalReview: 50,
      reviewDtoList: [
        ReviewDto(id: 1, username: "이현성", reviewContent: "너무좋았어요", lessonGrade: 3.5),
        ReviewDto(id: 2, username: "박지성", reviewContent: "너무좋습니다아아아", lessonGrade: 2.5),
        ReviewDto(id: 3, username: "정충섭", reviewContent: "다음에도 구매할것 같아요", lessonGrade: 4.5),
      ]),
  Lesson(
      id: 11,
      lessonName: "내 몸 상태 바로 알기 내몸에 꼭맞는 운동 테스트",
      lessonPrice: 50001,
      lessonTime: 108,
      lessonCount: 12,
      lessonImage: "https://picsum.photos/111",
      lessonCurriculum: "간단한 커리큘럼이 있습니다아.",
      lessonPlace: "부산관역시 부산진구 홍길동",
      possibleDays: "월요일",
      lessonPolicy: "취소 및 환불을 하면 솰라솰라 10회 피티 이용제한이 생기면서 한국 중국 러시아 일본 베트남 말레시아 영국 미국 북한 필리핀 브라질",
      profileDto: ProfileDto(id: 1, masterImage: "https://picsum.photos/211", masterIntroduction: "한국대학교 경호학과 졸업, 다수 대회에서 수상경력 있습니다."),
      masterName: "김동진",
      totalReview: 50,
      reviewDtoList: [
        ReviewDto(id: 1, username: "이현성", reviewContent: "너무좋았어요", lessonGrade: 3.5),
        ReviewDto(id: 2, username: "박지성", reviewContent: "너무좋습니다아아아", lessonGrade: 2.5),
        ReviewDto(id: 3, username: "정충섭", reviewContent: "다음에도 구매할것 같아요", lessonGrade: 4.5),
      ]),
  Lesson(
      id: 12,
      lessonName: "내 몸 상태 바로 알기 내몸에 꼭맞는 운동 테스트",
      lessonPrice: 50001,
      lessonTime: 108,
      lessonCount: 12,
      lessonImage: "https://picsum.photos/112",
      lessonCurriculum: "간단한 커리큘럼이 있습니다아.",
      lessonPlace: "부산관역시 부산진구 홍길동",
      possibleDays: "월요일",
      lessonPolicy: "취소 및 환불을 하면 솰라솰라 10회 피티 이용제한이 생기면서 한국 중국 러시아 일본 베트남 말레시아 영국 미국 북한 필리핀 브라질",
      profileDto: ProfileDto(id: 1, masterImage: "https://picsum.photos/212", masterIntroduction: "한국대학교 경호학과 졸업, 다수 대회에서 수상경력 있습니다."),
      masterName: "김동진",
      totalReview: 50,
      reviewDtoList: [
        ReviewDto(id: 1, username: "이현성", reviewContent: "너무좋았어요", lessonGrade: 3.5),
        ReviewDto(id: 2, username: "박지성", reviewContent: "너무좋습니다아아아", lessonGrade: 2.5),
        ReviewDto(id: 3, username: "정충섭", reviewContent: "다음에도 구매할것 같아요", lessonGrade: 4.5),
      ]),
];
