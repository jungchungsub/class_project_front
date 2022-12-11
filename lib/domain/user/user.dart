import 'dart:ffi';

class User {
  int id;
  String username;
  String password;

  User({
    required this.id,
    required this.username,
    required this.password,
  });

// json -> dynamic
  factory User.fromJson(Map<String, dynamic> json) => User(id: json["id"], username: json["username"], password: json["password"]);

// dynamic -> json
  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "password": password,
      };
}
