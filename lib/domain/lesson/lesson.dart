import 'dart:ffi';

import '../../dto/response/review_resp_dto.dart';

class Lesson {
  String lessonName;
  Int lessonPrice;
  Int lessonTime;
  Int lessonCount;
  String lessonPlace;
  String possibleDays;
  String lessonPolicy;
  String masterName;
  String masterImg;
  String masterIntroduction;
  List<ReviewRespDto> lessonReviewList;

  Lesson(
      {required this.lessonName,
      required this.lessonPrice,
      required this.lessonTime,
      required this.lessonCount,
      required this.lessonPlace,
      required this.possibleDays,
      required this.lessonPolicy,
      required this.masterName,
      required this.masterImg,
      required this.masterIntroduction,
      required this.lessonReviewList});

  factory Lesson.fromJson(Map<String, dynamic> json) => Lesson(
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
        lessonReviewList: json["lessonReviewList"],
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
        "lessonReviewList": lessonReviewList.map((e) => e.toJson()).toList(),
      };
}
