class LessonLatestListRespDto {
  int lessonId;
  int totalReview;
  double avgGrade;
  String lessonPhoto;
  String lessonName;
  int lessonPrice;
  bool subscribed;

  LessonLatestListRespDto({
    required this.lessonId,
    required this.totalReview,
    required this.avgGrade,
    required this.lessonPhoto,
    required this.lessonName,
    required this.lessonPrice,
    required this.subscribed,
  });

  factory LessonLatestListRespDto.fromJson(Map<String, dynamic> json) => LessonLatestListRespDto(
      lessonId: json["lessonId"],
      totalReview: json["totalReview"],
      avgGrade: json["avgGrade"],
      lessonPhoto: json["lessonPhoto"],
      lessonName: json["lessonName"],
      lessonPrice: json["lessonPrice"],
      subscribed: json["subscribed"]);
}
