// LessonInsertReqDto lessonRespDtoFromJson(String str) => LessonInsertReqDto.fromJson(json.decode(str));

import 'dart:convert';

String lessonRespDtoToJson(LessonInsertReqDto data) => json.encode(data.toJson());

class LessonInsertReqDto {
  LessonInsertReqDto({
    this.name,
    this.photo,
    this.price,
    this.place,
    this.lessonTime,
    this.lessonCount,
    this.possibleDays,
    this.curriculum,
    this.policy,
    this.deadline,
  });

  String? name;
  String? photo;
  int? price;
  String? place;
  int? lessonTime;
  int? lessonCount;
  String? possibleDays;
  String? curriculum;
  String? policy;
  String? deadline;
  LessonInsertReqDto.origin();

  Map<String, dynamic> toJson() => {
        "name": name,
        "photo": photo,
        "price": price,
        "place": place,
        "lessonTime": lessonTime,
        "lessonCount": lessonCount,
        "possibleDays": possibleDays,
        "curriculum": curriculum,
        "policy": policy,
        "deadline": deadline,
      };
}
