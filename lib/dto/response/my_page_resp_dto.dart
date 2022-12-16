// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

MyPageRespDto welcomeFromJson(String str) => MyPageRespDto.fromJson(json.decode(str));

String welcomeToJson(MyPageRespDto data) => json.encode(data.toJson());

class MyPageRespDto {
  MyPageRespDto({
    required this.id,
    required this.username,
    required this.role,
    this.profileDto,
  });

  int id;
  String username;
  String role;
  ProfileDto? profileDto;

  factory MyPageRespDto.fromJson(Map<String, dynamic> json) => MyPageRespDto(
        id: json["id"],
        username: json["username"],
        role: json["role"] == "USER" ? "일반회원" : "전문가",
        profileDto: ProfileDto.fromJson(
          json["profileDto"] ?? {},
        ),
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "role": role,
        "profileDto": profileDto?.toJson(),
      };
}

class ProfileDto {
  ProfileDto({
    this.id,
    this.profilePhoto,
  });

  int? id;
  String? profilePhoto;
  factory ProfileDto.fromJson(Map<String, dynamic> json) => ProfileDto(
        // null일 경우 id : 0, Photo : ''리턴
        id: json["id"] ?? 0,
        profilePhoto: json["profilePhoto"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "profilePhoto": profilePhoto,
      };
}
