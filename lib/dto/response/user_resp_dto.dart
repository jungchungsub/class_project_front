class UserRespDto {
  // 수정 필요
  int id;
  String username;
  String role;
  String createdAt;

  UserRespDto({
    required this.id,
    required this.username,
    required this.role,
    required this.createdAt,
  });

  // json -> dynamic
  factory UserRespDto.fromJson(Map<String, dynamic> json) => UserRespDto(
        id: json["id"],
        username: json["username"],
        role: json["role"],
        createdAt: json["createdAt"],
      );

// dynamic -> json
  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "role": role,
        "createdAt": createdAt,
      };
}
