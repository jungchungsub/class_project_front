class LessonClientListRespDto {
  String lessonTitle;
  String masterName;
  int lessonPrice;
  String expiredDate;
  String lessonImage;

  LessonClientListRespDto({
    required this.lessonTitle,
    required this.masterName,
    required this.lessonPrice,
    required this.expiredDate,
    required this.lessonImage,
  });
}

List<LessonClientListRespDto> LessonClientList = [
  LessonClientListRespDto(
    lessonTitle: "깔끔하고 감각적인 최고의 홈페이지를 제작해드립니다.",
    masterName: "유리아",
    lessonPrice: 50000,
    expiredDate: "2022.12.07",
    lessonImage: "https://picsum.photos/207",
  ),
  LessonClientListRespDto(
    lessonTitle: "보안성에서 뛰어난 프로그래밍 해드립니다.",
    masterName: "정충섭",
    lessonPrice: 100000,
    expiredDate: "2022.12.07",
    lessonImage: "https://picsum.photos/206",
  ),
  LessonClientListRespDto(
    lessonTitle: "게임 만들어 드립니다.",
    masterName: "이문기",
    lessonPrice: 1000000,
    expiredDate: "2022.12.07",
    lessonImage: "https://picsum.photos/205",
  ),
  LessonClientListRespDto(
    lessonTitle: "웹 페이지 제작해 드립니다.",
    masterName: "진도진",
    lessonPrice: 2000000,
    expiredDate: "2022.12.07",
    lessonImage: "https://picsum.photos/204",
  ),
  LessonClientListRespDto(
    lessonTitle: "제빵 기술 알려드립니다.",
    masterName: "제빵왕김탁구",
    lessonPrice: 100000,
    expiredDate: "2022.12.07",
    lessonImage: "https://picsum.photos/203",
  ),
  LessonClientListRespDto(
    lessonTitle: "노래 발성을 잡아드립니다.",
    masterName: "아이유",
    lessonPrice: 100000,
    expiredDate: "2022.12.07",
    lessonImage: "https://picsum.photos/202",
  ),
];
