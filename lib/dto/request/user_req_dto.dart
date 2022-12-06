import 'category_req_dto.dart';

class UserReqDto {
  String username;
  String password;
  String email;
  String phoneNum;
  String role;
  List<Category> category;

  UserReqDto(
      {required this.username, required this.password, required this.email, required this.phoneNum, required this.role, required this.category});

  // json -> dynamic
  factory UserReqDto.fromJson(Map<String, dynamic> json) => UserReqDto(
      username: json["username"],
      password: json["password"],
      email: json["email"],
      phoneNum: json["phoneNum"],
      role: json["role"],
      category: json["category"]);

// dynamic -> json
  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "email": email,
        "phoneNum": phoneNum,
        "role": role,
        "category": category.map((e) => e.toJson()).toList(), // list타입이기 때문에 한번에 처리
      };
}
