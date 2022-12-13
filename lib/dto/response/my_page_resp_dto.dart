class MyPageRespDto {
  int id;
  String username;
  String role;
  String filePath;

  MyPageRespDto({
    required this.id,
    required this.username,
    required this.role,
    required this.filePath,
  });

  factory MyPageRespDto.fromJson(Map<String, dynamic> json) => MyPageRespDto(
        id: json["id"],
        username: json["username"],
        role: json["role"],
        filePath: json["filePath"],
      );
}
