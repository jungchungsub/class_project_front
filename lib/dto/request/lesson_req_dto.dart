import 'dart:convert';

LessonInsertReqDto lessonRespDtoFromJson(String str) => LessonInsertReqDto.fromJson(json.decode(str));

String lessonRespDtoToJson(LessonInsertReqDto data) => json.encode(data.toJson());

class LessonInsertReqDto {
  LessonInsertReqDto({
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

  String name;
  String photo;
  int price;
  String place;
  int lessonTime;
  int lessonCount;
  String possibleDays;
  String curriculum;
  String policy;
  DateTime deadline;
  int categoryId;

  factory LessonInsertReqDto.fromJson(Map<String, dynamic> json) => LessonInsertReqDto(
        name: json["name"],
        photo: json["photo"],
        price: json["price"],
        place: json["place"],
        lessonTime: json["lessonTime"],
        lessonCount: json["lessonCount"],
        possibleDays: json["possibleDays"],
        curriculum: json["curriculum"],
        policy: json["policy"],
        deadline: DateTime.parse(json["deadline"]),
        categoryId: json["categoryId"],
      );
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
        "deadline": deadline.toIso8601String(),
        "categoryId": categoryId,
      };
}
