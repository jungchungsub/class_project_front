// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<buyingListRespDto> welcomeFromJson(String str) => List<buyingListRespDto>.from(json.decode(str).map((x) => buyingListRespDto.fromJson(x)));

String welcomeToJson(List<buyingListRespDto> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class buyingListRespDto {
  buyingListRespDto({
    required this.lessonId,
    required this.lessonPhoto,
    required this.lessonName,
    required this.lessonPrice,
    required this.lessonDeadline,
  });

  int lessonId;
  String lessonPhoto;
  String lessonName;
  int lessonPrice;
  DateTime lessonDeadline;

  factory buyingListRespDto.fromJson(Map<String, dynamic> json) => buyingListRespDto(
        lessonId: json["lessonId"],
        lessonPhoto: json["lessonPhoto"],
        lessonName: json["lessonName"],
        lessonPrice: json["lessonPrice"],
        lessonDeadline: DateTime.parse(json["lessonDeadline"]),
      );

  Map<String, dynamic> toJson() => {
        "lessonId": lessonId,
        "lessonPhoto": lessonPhoto,
        "lessonName": lessonName,
        "lessonPrice": lessonPrice,
        "lessonDeadline": lessonDeadline.toIso8601String(),
      };
}
