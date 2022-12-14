import 'dart:convert';

class SubscribeListRespDto {
  int id;
  User user;
  Lesson lesson;

  SubscribeListRespDto({
    required this.id,
    required this.user,
    required this.lesson,
  });

  factory SubscribeListRespDto.fromJson(Map<String, dynamic> json) => SubscribeListRespDto(
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
