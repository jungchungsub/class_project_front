import 'dart:convert';

List<LessonSearchRespDto> lessonRespDtoFromJson(String str) =>
    List<LessonSearchRespDto>.from(json.decode(str).map((x) => LessonSearchRespDto.fromJson(x)));

String lessonRespDtoToJson(List<LessonSearchRespDto> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LessonSearchRespDto {
  LessonSearchRespDto({
    required this.lessonId,
    required this.lessonName,
    required this.lessonPrice,
    required this.avgGrade,
    required this.totalReviews,
    required this.recommand,
    required this.ranking,
    required this.recent,
    required this.subscribed,
  });

  int lessonId;
  String lessonName;
  int lessonPrice;
  int avgGrade;
  int totalReviews;
  bool recommand;
  int ranking;
  DateTime recent;
  bool subscribed;

  factory LessonSearchRespDto.fromJson(Map<String, dynamic> json) => LessonSearchRespDto(
        lessonId: json["lessonId"],
        lessonName: json["lessonName"],
        lessonPrice: json["lessonPrice"],
        avgGrade: json["avgGrade"],
        totalReviews: json["totalReviews"],
        recommand: json["recommand"],
        ranking: json["ranking"],
        recent: DateTime.parse(json["recent"]),
        subscribed: json["subscribed"],
      );

  Map<String, dynamic> toJson() => {
        "lessonId": lessonId,
        "lessonName": lessonName,
        "lessonPrice": lessonPrice,
        "avgGrade": avgGrade,
        "totalReviews": totalReviews,
        "recommand": recommand,
        "ranking": ranking,
        "recent": recent.toIso8601String(),
        "subscribed": subscribed,
      };
}
