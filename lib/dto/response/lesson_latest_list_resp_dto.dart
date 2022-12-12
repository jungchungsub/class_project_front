class LessonLatestListRespDto {
  String username;
  String reviewContent;
  double lessonGrade;

  LessonLatestListRespDto({
    required this.username,
    required this.reviewContent,
    required this.lessonGrade,
  });

  factory LessonLatestListRespDto.fromJson(Map<String, dynamic> json) => LessonLatestListRespDto(
        username: json["username"],
        reviewContent: json["reviewContent"],
        lessonGrade: json["lessonGrade"],
      );
}
