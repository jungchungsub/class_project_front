import 'package:intl/intl.dart';

class UserRespDto {
  // 수정 필요
  int id;
  String username;
  String password;
  String phoneNum;
  String email;
  String role;
  DateTime createdAt;

  UserRespDto({
    required this.id,
    required this.username,
    required this.password,
    required this.phoneNum,
    required this.email,
    required this.role,
    required this.createdAt,
  });

  // json -> dynamic
  factory UserRespDto.fromJson(Map<String, dynamic> json) => UserRespDto(
        id: json["id"],
        username: json["username"],
        password: json["password"],
        phoneNum: json["phoneNum"],
        email: json["email"],
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
