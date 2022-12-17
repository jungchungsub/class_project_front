import 'dart:convert';

MasterRespDto welcomeFromJson(String str) => MasterRespDto.fromJson(json.decode(str));

String welcomeToJson(MasterRespDto data) => json.encode(data.toJson());

class MasterRespDto {
  MasterRespDto({
    this.profilePhoto,
    required this.username,
    required this.satisfaction,
    required this.totalLesson,
    required this.isApproval,
  });

  String? profilePhoto;
  String username;
  int satisfaction;
  int totalLesson;
  bool isApproval;

  factory MasterRespDto.fromJson(Map<String, dynamic> json) => MasterRespDto(
        profilePhoto: json["profilePhoto"],
        username: json["username"],
        satisfaction: json["satisfaction"],
        totalLesson: json["totalLesson"],
        isApproval: json["isApproval"],
      );

  Map<String, dynamic> toJson() => {
        "profilePhoto": profilePhoto,
        "username": username,
        "satisfaction": satisfaction,
        "totalLesson": totalLesson,
        "isApproval": isApproval,
      };
}
