import 'package:extended_image/extended_image.dart';
import 'package:finalproject_front/dummy_models/lesson_category_list_resp_dto.dart';
import 'package:finalproject_front/pages/user/user_login_my_page/model/user_login_my_page_model.dart';

import 'review_resp_dto.dart';

class LessonRespDto {
  String lessonId;
  LessonDto lessonDto;
  ProfileDto profileDto;
  double lessonAvgGrade;
  bool isSubscribed;
  List<ReviewRespDto> lessonReviewList;

  LessonRespDto({
    required this.lessonId,
    required this.lessonDto,
    required this.profileDto,
    required this.isSubscribed,
    required this.lessonAvgGrade,
    required this.lessonReviewList,
  });

  factory LessonRespDto.fromJson(Map<String, dynamic> json) {
    // var possibleFromJson = json['possibleDays'];
    // List<String> possibleList = new List<String>.from(possibleFromJson);
    return LessonRespDto(
        lessonId: json['lessonId'],
        lessonDto: LessonDto(
          curriculum: json['curriculum'],
          lessonName: json['lessonName'],
          lessonCount: json['lessonCount'],
          lessonPlace: json['lessonPlace'],
          lessonPolicy: json['lessonPolicy'],
          lessonPrice: json['lessonPrice'],
          lessonTime: json['lessonTime'],
          possibleDays: (json['possibleList']),
        ),
        profileDto: ProfileDto(
          expertPhoto: json['expertPertPhoto'],
          expertIntroduction: json['expertIntroduction'],
        ),
        isSubscribed: json['isSubscribed'],
        lessonAvgGrade: json['lessonAvgGrade'],
        lessonReviewList: (json["lessonReviewList"].map((e) => e == null ? null : ReviewRespDto.fromJson(e).toJson())));
  }
}

class LessonDto {
  String lessonName;
  int lessonPrice;
  int lessonTime;
  int lessonCount;
  String curriculum;
  String lessonPlace;
  List<String> possibleDays;
  String lessonPolicy;

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
}

class ProfileDto {
  String expertPhoto;
  String expertIntroduction;

  ProfileDto({
    required this.expertPhoto,
    required this.expertIntroduction,
  });
}
