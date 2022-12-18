// To parse this JSON data, do
//
//     final lessonRespDto = lessonRespDtoFromJson(jsonString);

import 'dart:convert';

List<CategoryRespDto> lessonRespDtoFromJson(String str) => List<CategoryRespDto>.from(json.decode(str).map((x) => CategoryRespDto.fromJson(x)));

String lessonRespDtoToJson(List<CategoryRespDto> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryRespDto {
  CategoryRespDto({
    required this.lessonId,
    required this.lessonName,
    required this.lessonPrice,
    required this.avgGrade,
    required this.totalReviews,
    required this.recommand,
    required this.ranking,
    required this.recent,
    required this.isSubscribed,
  });

  int lessonId;
  String lessonName;
  int lessonPrice;
  int avgGrade;
  int totalReviews;
  bool recommand;
  int ranking;
  DateTime recent;
  bool isSubscribed;

  factory CategoryRespDto.fromJson(Map<String, dynamic> json) => CategoryRespDto(
        lessonId: json["lessonId"],
        lessonName: json["lessonName"],
        lessonPrice: json["lessonPrice"],
        avgGrade: json["avgGrade"],
        totalReviews: json["totalReviews"],
        recommand: json["recommand"],
        ranking: json["ranking"],
        recent: DateTime.parse(json["recent"]),
        isSubscribed: json["isSubscribed"],
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
        "subscribed": isSubscribed,
      };
}
