class MyPageRespDto {
  int id;
  String username;
  String role;
  String imagePath;

  MyPageRespDto({
    required this.id,
    required this.username,
    required this.role,
    required this.imagePath,
  });

  factory MyPageRespDto.fromJson(Map<String, dynamic> json) => MyPageRespDto(
        id: json["id"],
        username: json["username"],
        role: json["role"],
        imagePath: json["imagePath"],
      );
}
