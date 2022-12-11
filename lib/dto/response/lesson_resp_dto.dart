import 'review_resp_dto.dart';

class LessonRespDto {
  int? id;
  String lessonName;
  int lessonPrice;
  int lessonTime;
  int lessonCount;
  String lessonPlace;
  String possibleDays;
  String lessonPolicy;
  String masterName;
  String masterImg;
  String masterIntroduction;
  List<ReviewRespDto> lessonReviewList;

  LessonRespDto(
      {required this.id,
      required this.lessonName,
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

  factory LessonRespDto.fromJson(Map<String, dynamic> json) => LessonRespDto(
        id: json["id"],
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
        //Nested Structure이기 때문에 한번에 map처리 null이 아니면 fromjson을 실행.
        lessonReviewList: (json["lessonReviewList"]).map((e) => e == null ? null : ReviewRespDto.fromJson(e).toJson()),
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
        //Nested Structure이기 때문에 한번에 map처리
        "lessonReviewList": lessonReviewList.map((e) => e.toJson()).toList(),
      };
}
