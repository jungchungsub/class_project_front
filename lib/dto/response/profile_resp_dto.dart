// To parse this JSON data, do
//
//     final responseDto = responseDtoFromJson(jsonString);

import 'dart:convert';

ProfileDetailRespDto responseDtoFromJson(String str) => ProfileDetailRespDto.fromJson(json.decode(str));

String responseDtoToJson(ProfileDetailRespDto data) => json.encode(data.toJson());

class ProfileDetailRespDto {
  ProfileDetailRespDto({
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
  String? introduction;
  String? region;
  String? certification;
  String? careerYear;
  String? career;
  User user;

  factory ProfileDetailRespDto.fromJson(Map<String, dynamic> json) => ProfileDetailRespDto(
        id: json["id"],
        filePath: json["filePath"] ?? '',
        introduction: json["introduction"] ?? '자기소개를 입력해주세요',
        region: json["region"] ?? '지역을 입력해주세요',
        certification: json["certification"] ?? '자격증을 입력해주세요',
        careerYear: json["careerYear"] ?? '경력 기간을 입력해주세요',
        career: json["career"] ?? '학력 전공을 입력해주세요',
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
