// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

UserPageRespDto userFromJson(String str) => UserPageRespDto.fromJson(json.decode(str));

String userToJson(UserPageRespDto data) => json.encode(data.toJson());

MasterPageRespDto masterFromJson(String str) => MasterPageRespDto.fromJson(json.decode(str));

String masterToJson(MasterPageRespDto data) => json.encode(data.toJson());

class UserPageRespDto {
  UserPageRespDto({
    required this.id,
    required this.username,
    required this.role,
    this.profileDto,
  });

  int id;
  String username;
  String role;
  ProfileDto? profileDto;

  factory UserPageRespDto.fromJson(Map<String, dynamic> json) => UserPageRespDto(
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

class MasterPageRespDto {
  MasterPageRespDto({
    this.profileId,
    this.profilePhoto,
    required this.username,
    required this.satisfaction,
    required this.totalLesson,
    // required this.isApproval,
  });

  String? profilePhoto;
  String username;
  int satisfaction;
  int totalLesson;
  int? profileId;
  // bool isApproval;

  factory MasterPageRespDto.fromJson(Map<String, dynamic> json) => MasterPageRespDto(
        profileId: json["profileId"] ?? 0,
        profilePhoto: json["profilePhoto"] ?? '',
        username: json["username"],
        satisfaction: json["satisfaction"],
        totalLesson: json["totalLesson"],
        // isApproval: json["isApproval"],
      );

  Map<String, dynamic> toJson() => {
        "profilePhoto": profilePhoto,
        "username": username,
        "satisfaction": satisfaction,
        "totalLesson": totalLesson,
        // "isApproval": isApproval,
      };
}
