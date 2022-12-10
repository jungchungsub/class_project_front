import 'dart:ffi';

class User {
  int id;
  String username;
  String password;
  String email;
  String phoneNum;
  User({required this.id, required this.username, required this.password, required this.email, required this.phoneNum});

// json -> dynamic
  factory User.fromJson(Map<String, dynamic> json) =>
      User(id: json["id"], username: json["username"], password: json["password"], email: json["email"], phoneNum: json["phoneNum"]);

// dynamic -> json
  Map<String, dynamic> toJson() => {"id": id, "username": username, "password": password, "email": email, "phoneNum": phoneNum};
}
