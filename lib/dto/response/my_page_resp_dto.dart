import 'dart:convert';

MyPageRespDto responseDtoFromJson(String str) => MyPageRespDto.fromJson(json.decode(str));

String responseDtoToJson(MyPageRespDto data) => json.encode(data.toJson());

class MyPageRespDto {
  MyPageRespDto({
    required this.id,
    required this.username,
    required this.role,
    required this.filePath,
  });

  int id;
  String username;
  String role;
  dynamic filePath;

  factory MyPageRespDto.fromJson(Map<String, dynamic> json) => MyPageRespDto(
        id: json["id"],
        username: json["username"],
        role: json["role"],
        filePath: json["filePath"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "role": role,
        "filePath": filePath,
      };
}
