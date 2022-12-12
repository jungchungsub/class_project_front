import 'package:extended_image/extended_image.dart';

import 'review_resp_dto.dart';

class LessonRespDto {
  int? lessonId;
  String lessonName;
  int lessonPrice;
  int lessonTime;
  int lessonCount;
  // int curriculum;
  String lessonPlace;
  String possibleDays;
  String lessonPolicy;
  String masterName;
  String masterImg;
  String masterIntroduction;
  // List<ReviewRespDto> lessonReviewList;

  LessonRespDto({
    required this.lessonId,
    required this.lessonName,
    required this.lessonPrice,
    required this.lessonTime,
    required this.lessonCount,
    required this.lessonPlace,
    // required this.curriculum,
    required this.possibleDays,
    required this.lessonPolicy,
    required this.masterName,
    required this.masterImg,
    required this.masterIntroduction,
    // required this.lessonReviewList,
  });

  factory LessonRespDto.fromJson(Map<String, dynamic> json) => LessonRespDto(
        lessonId: json["id"],
        lessonName: json["lessonName"],
        lessonPrice: json["lessonPrice"],
        lessonTime: json["lessonTime"],
        lessonCount: json["lessonCount"],
        lessonPlace: json["lessonPlace"],
        possibleDays: json["possibleDays"],
        lessonPolicy: json["lessonPolicy"],
        masterName: json["masterName"],
        masterImg: json["masterImg"],
        masterIntroduction: json["masterIntroduction"],
        // lessonReviewList: (json["lessonReviewList"]).map((e) => e == null ? null : ReviewRespDto.fromJson(e).toJson()),
      );
  Map<String, dynamic> toJson() => {
        "lessonName": lessonName,
        "lessonPrice": lessonPrice,
        "lessonTime": lessonTime,
        "lessonCount": lessonCount,
        "lessonPlace": lessonPlace,
        "possibleDays": possibleDays,
        "lessonPolicy": lessonPolicy,
        "masterName": masterName,
        "masterImg": masterImg,
        "masterIntroduction": masterIntroduction,
        // "lessonReviewList": lessonReviewList.map((e) => e.toJson()).toList(),
      };
}
