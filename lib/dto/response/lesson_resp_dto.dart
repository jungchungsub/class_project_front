import 'dart:convert';
import 'dart:core';

import 'package:logger/logger.dart';

LessonRespDto lessonRespDtoFromJson(String str) => LessonRespDto.fromJson(json.decode(str));

String lessonRespDtoToJson(LessonRespDto data) => json.encode(data.toJson());

class LessonRespDto {
  LessonRespDto({
    required this.lessonDto,
    required this.profileDto,
    required this.lessonAvgGrade,
    required this.lessonTotalReviewsCount,
    required this.lessonReviewList,
    required this.subscribed,
  });

  LessonDto lessonDto;
  ProfileDto profileDto;
  double lessonAvgGrade;
  int lessonTotalReviewsCount;
  List<LessonReviewList> lessonReviewList;
  bool subscribed;

  factory LessonRespDto.fromJson(Map<String, dynamic> json) {
    // if (check != "NaN") {
    //   //temp = json["lessonAvgGrade"].toInt();
    // }
    return LessonRespDto(
      lessonDto: LessonDto.fromJson(json["lessonDto"]),
      profileDto: ProfileDto.fromJson(json["profileDto"]),
      lessonTotalReviewsCount: json["lessonTotalReviewsCount"],
      lessonAvgGrade: json["lessonAvgGrade"],
      lessonReviewList: List<LessonReviewList>.from(json["lessonReviewList"].map((x) => LessonReviewList.fromJson(x))),
      subscribed: json["subscribed"],
    );
  }

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
    required this.expertName,
  });

  String expertName;
  String expertPhoto;
  String expertIntroduction;

  factory ProfileDto.fromJson(Map<String, dynamic> json) => ProfileDto(
        expertName: json["expertName"],
        expertPhoto: json["expertPhoto"],
        expertIntroduction: json["expertIntroduction"],
      );

  Map<String, dynamic> toJson() => {
        "expertPhoto": expertPhoto,
        "expertIntroduction": expertIntroduction,
      };
}

class LessonInsertRespDto {
  String name;
  String photo;
  int price;
  String place;
  int lessonTime;
  int lessonCount;
  String possibleDays;
  String curriculum;
  String policy;
  String deadline;
  int categoryId;
  // List<int>? categoryId;
  //List<int> categoryId = category.map((category) => category.id).toList();

  LessonInsertRespDto({
    required this.name,
    required this.photo,
    required this.price,
    required this.place,
    required this.lessonTime,
    required this.lessonCount,
    required this.possibleDays,
    required this.curriculum,
    required this.policy,
    required this.deadline,
    required this.categoryId,
  });

  factory LessonInsertRespDto.fromJson(Map<String, dynamic> json) => LessonInsertRespDto(
        name: json["name"],
        photo: json["photo"],
        price: json["price"],
        place: json["place"],
        lessonTime: json["lessonTime"],
        lessonCount: json["lessonCount"],
        possibleDays: json["possibleDays"],
        curriculum: json["curriculum"],
        policy: json["policy"],
        deadline: json["deadline"],
        categoryId: json["categoryId"],
      );
}
