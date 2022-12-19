// To parse this JSON data, do
//
//     final lessonRespDto = lessonRespDtoFromJson(jsonString);

import 'dart:convert';

List<LessonRespDto> lessonRespDtoFromJson(String str) => List<LessonRespDto>.from(json.decode(str).map((x) => LessonRespDto.fromJson(x)));

String lessonRespDtoToJson(List<LessonRespDto> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LessonRespDto {
  LessonRespDto({
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

  factory LessonRespDto.fromJson(Map<String, dynamic> json) => LessonRespDto(
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
