import 'package:intl/intl.dart';

class UserLoginRespDto {
  // 수정 필요
  int id;
  String username;
  String role;
  DateTime createdAt;

  UserLoginRespDto({
    required this.id,
    required this.username,
    required this.role,
    required this.createdAt,
  });

  // json -> dynamic
  factory UserLoginRespDto.fromJson(Map<String, dynamic> json) => UserLoginRespDto(
        id: json["id"],
        username: json["username"],
        role: json["role"],
        createdAt: DateFormat("yyyy-mm-dd").parse(json["createdAt"]),
      );

// // dynamic -> json
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "username": username,
//         "role": role,
//         "createdAt": createdAt,
//         "email": email,
//       };
}
