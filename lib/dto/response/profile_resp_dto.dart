// To parse this JSON data, do
//
//     final responseDto = responseDtoFromJson(jsonString);

import 'dart:convert';

ProfileRespDto responseDtoFromJson(String str) => ProfileRespDto.fromJson(json.decode(str));

String responseDtoToJson(ProfileRespDto data) => json.encode(data.toJson());

class ProfileRespDto {
  ProfileRespDto({
    required this.id,
    required this.filePath,
    required this.introduction,
    required this.region,
    required this.certification,
    required this.careerYear,
    required this.career, // 학력
    required this.user,
  });

  int id;
  String? filePath;
  String introduction;
  String region;
  String certification;
  String careerYear;
  String career;
  User user;

  factory ProfileRespDto.fromJson(Map<String, dynamic> json) => ProfileRespDto(
        id: json["id"],
        filePath: json["filePath"],
        introduction: json["introduction"],
        region: json["region"],
        certification: json["certification"],
        careerYear: json["careerYear"],
        career: json["career"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "filePath": filePath,
        "introduction": introduction,
        "region": region,
        "certification": certification,
        "careerYear": careerYear,
        "career": career,
        "user": user.toJson(),
      };
}

class User {
  User({
    required this.id,
    required this.username,
  });

  int id;
  String username;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
      };
}
