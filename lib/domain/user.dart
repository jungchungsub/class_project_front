import 'package:intl/intl.dart';

class User {
  int id;
  String username;
  String password;
  String phoneNum;
  String email;
  String role;
  DateTime createdAt;

  User({
    required this.id,
    required this.username,
    required this.password,
    required this.phoneNum,
    required this.email,
    required this.role,
    required this.createdAt,
  });

// json -> dynamic
  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        password: json["password"],
        phoneNum: json["phoneNum"],
        email: json["email"],
        role: json["role"],
        createdAt: DateFormat("yyyy-mm-dd").parse(json["createdAt"]),
      );
}
