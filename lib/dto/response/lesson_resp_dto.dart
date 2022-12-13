// To parse this JSON data, do
//
//     final lessonRespDto = lessonRespDtoFromJson(jsonString);

import 'dart:convert';

LessonRespDto lessonRespDtoFromJson(String str) => LessonRespDto.fromJson(json.decode(str));

String lessonRespDtoToJson(LessonRespDto data) => json.encode(data.toJson());

class LessonRespDto {
  LessonRespDto({
    required this.lessonDto,
    required this.profileDto,
    required this.lessonAvgGrade,
    required this.lessonReviewList,
    required this.subscribed,
  });

  LessonDto lessonDto;
  ProfileDto profileDto;
  double lessonAvgGrade;
  List<LessonReviewList> lessonReviewList;
  bool subscribed;

  factory LessonRespDto.fromJson(Map<String, dynamic> json) => LessonRespDto(
        lessonDto: LessonDto.fromJson(json["lessonDto"]),
        profileDto: ProfileDto.fromJson(json["profileDto"]),
        lessonAvgGrade: json["lessonAvgGrade"].toDouble(),
        lessonReviewList: List<LessonReviewList>.from(json["lessonReviewList"].map((x) => LessonReviewList.fromJson(x))),
        subscribed: json["subscribed"],
      );

  Map<String, dynamic> toJson() => {
        "lessonDto": lessonDto.toJson(),
        "profileDto": profileDto.toJson(),
        "lessonAvgGrade": lessonAvgGrade,
        "lessonReviewList": List<dynamic>.from(lessonReviewList.map((x) => x.toJson())),
        "subscribed": subscribed,
      };
}

class LessonDto {
  LessonDto({
    required this.lessonName,
    required this.lessonPrice,
    required this.lessonTime,
    required this.lessonCount,
    required this.curriculum,
    required this.lessonPlace,
    required this.possibleDays,
    required this.lessonPolicy,
  });

  String lessonName;
  int lessonPrice;
  int lessonTime;
  int lessonCount;
  String curriculum;
  String lessonPlace;
  List<String> possibleDays;
  String lessonPolicy;

  factory LessonDto.fromJson(Map<String, dynamic> json) => LessonDto(
        lessonName: json["lessonName"],
        lessonPrice: json["lessonPrice"],
        lessonTime: json["lessonTime"],
        lessonCount: json["lessonCount"],
        curriculum: json["curriculum"],
        lessonPlace: json["lessonPlace"],
        possibleDays: List<String>.from(json["possibleDays"].map((x) => x)),
        lessonPolicy: json["lessonPolicy"],
      );

  Map<String, dynamic> toJson() => {
        "lessonName": lessonName,
        "lessonPrice": lessonPrice,
        "lessonTime": lessonTime,
        "lessonCount": lessonCount,
        "curriculum": curriculum,
        "lessonPlace": lessonPlace,
        "possibleDays": List<dynamic>.from(possibleDays.map((x) => x)),
        "lessonPolicy": lessonPolicy,
      };
}

class LessonReviewList {
  LessonReviewList({
    required this.username,
    required this.reviewContent,
    required this.lessonGrade,
  });

  String username;
  String reviewContent;
  double lessonGrade;

  factory LessonReviewList.fromJson(Map<String, dynamic> json) => LessonReviewList(
        username: json["username"],
        reviewContent: json["reviewContent"],
        lessonGrade: json["lessonGrade"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "reviewContent": reviewContent,
        "lessonGrade": lessonGrade,
      };
}

class ProfileDto {
  ProfileDto({
    required this.expertPhoto,
    required this.expertIntroduction,
  });

  String expertPhoto;
  String expertIntroduction;

  factory ProfileDto.fromJson(Map<String, dynamic> json) => ProfileDto(
        expertPhoto: json["expertPhoto"],
        expertIntroduction: json["expertIntroduction"],
      );

  Map<String, dynamic> toJson() => {
        "expertPhoto": expertPhoto,
        "expertIntroduction": expertIntroduction,
      };
}
