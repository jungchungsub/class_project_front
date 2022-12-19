import 'dart:convert';

// LessonInsertReqDto lessonRespDtoFromJson(String str) => LessonInsertReqDto.fromJson(json.decode(str));

String lessonRespDtoToJson(LessonUpdateReqDto data) => json.encode(data.toJson());

class LessonUpdateReqDto {
  LessonUpdateReqDto({
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
    this.categoryId,
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
  int? categoryId;
  LessonUpdateReqDto.origin();

  // factory LessonInsertReqDto.fromJson(Map<String, dynamic> json) => LessonInsertReqDto(
  //       name: json["name"],
  //       photo: json["photo"],
  //       price: json["price"],
  //       place: json["place"],
  //       lessonTime: json["lessonTime"],
  //       lessonCount: json["lessonCount"],
  //       possibleDays: json["possibleDays"],
  //       curriculum: json["curriculum"],
  //       policy: json["policy"],
  //       deadline: DateTime.parse(json["deadline"]),
  //     );
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
        "categoryId": categoryId,
      };
}

String lessonUpdateReqDtoToJson(LessonUpdateReqDto data) => json.encode(data.toJson());

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
    this.categoryId,
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
  int? categoryId;
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
        "categoryId": categoryId,
      };
}
