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
    required this.isSubscribed,
  });

  int lessonId;
  String lessonName;
  int lessonPrice;
  double avgGrade;
  int totalReviews;
  bool? isSubscribed;

  factory CategoryRespDto.fromJson(Map<String, dynamic> json) => CategoryRespDto(
        lessonId: json["lessonId"],
        lessonName: json["lessonName"],
        lessonPrice: json["lessonPrice"],
        avgGrade: json["avgGrade"],
        totalReviews: json["totalReviews"],
        isSubscribed: json["isSubscribed"],
      );

  Map<String, dynamic> toJson() => {
        "lessonId": lessonId,
        "lessonName": lessonName,
        "lessonPrice": lessonPrice,
        "avgGrade": avgGrade,
        "totalReviews": totalReviews,
        "subscribed": isSubscribed,
      };
}
