// To parse this JSON data, do
//
//     final lessonRespDto = lessonRespDtoFromJson(jsonString);

import 'dart:convert';

SubscribeRespDto lessonRespDtoFromJson(String str) => SubscribeRespDto.fromJson(json.decode(str));

String lessonRespDtoToJson(SubscribeRespDto data) => json.encode(data.toJson());

class SubscribeRespDto {
  SubscribeRespDto({
    required this.subscribes,
  });

  List<Subscribe> subscribes;

  factory SubscribeRespDto.fromJson(Map<String, dynamic> json) => SubscribeRespDto(
        subscribes: List<Subscribe>.from(json["subscribes"].map((x) => Subscribe.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "subscribes": List<dynamic>.from(subscribes.map((x) => x.toJson())),
      };
}

class Subscribe {
  Subscribe({
    required this.id,
    required this.user,
    required this.lesson,
  });

  int id;
  User user;
  Lesson lesson;

  factory Subscribe.fromJson(Map<String, dynamic> json) => Subscribe(
        id: json["id"],
        user: User.fromJson(json["user"]),
        lesson: Lesson.fromJson(json["lesson"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user.toJson(),
        "lesson": lesson.toJson(),
      };
}

class Lesson {
  Lesson({
    required this.id,
    required this.name,
    required this.photo,
    required this.price,
  });

  int id;
  String name;
  String photo;
  int price;

  factory Lesson.fromJson(Map<String, dynamic> json) => Lesson(
        id: json["id"],
        name: json["name"],
        photo: json["photo"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "photo": photo,
        "price": price,
      };
}

class User {
  User({
    required this.username,
  });

  String username;

  factory User.fromJson(Map<String, dynamic> json) => User(
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
      };
}
