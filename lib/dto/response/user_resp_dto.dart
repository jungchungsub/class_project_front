class UserRespDto {
  // 수정 필요
  int userId;
  String username;
  String role;
  String createdAt;

  UserRespDto({
    required this.userId,
    required this.username,
    required this.role,
    required this.createdAt,
  });

  // json -> dynamic
  factory UserRespDto.fromJson(Map<String, dynamic> json) => UserRespDto(
        userId: json["userId"],
        username: json["username"],
        role: json["role"],
        createdAt: json["createdAt"],
      );

// dynamic -> json
  Map<String, dynamic> toJson() => {
        "userId": userId,
        "username": username,
        "role": role,
        "createdAt": createdAt,
      };
}
