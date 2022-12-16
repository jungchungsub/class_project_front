// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

ReviewReqDto welcomeFromJson(String str) => ReviewReqDto.fromJson(json.decode(str));

String welcomeToJson(ReviewReqDto data) => json.encode(data.toJson());

class ReviewReqDto {
  ReviewReqDto.single();
  ReviewReqDto({
    this.content,
    this.grade,
  });

  String? content;
  double? grade;

  factory ReviewReqDto.fromJson(Map<String, dynamic> json) => ReviewReqDto(
        content: json["content"],
        grade: json["grade"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "content": content,
        "grade": grade,
      };
}
