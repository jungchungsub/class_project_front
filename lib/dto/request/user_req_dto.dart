class UserReqDto {
  String username;
  String password;
  String email;
  String phoneNum;
  String role;
  List<int> categoryId;

  UserReqDto(
      {required this.username,
      required this.password,
      required this.email,
      required this.phoneNum,
      required this.role,
      required this.categoryId});

  // json -> dynamic
  factory UserReqDto.fromJson(Map<String, dynamic> json) => UserReqDto(
      username: json["username"],
      password: json["password"],
      email: json["email"],
      phoneNum: json["phoneNum"],
      role: json["role"],
      categoryId: json["categoryId"]);

// dynamic -> json
  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "email": email,
        "phoneNum": phoneNum,
        "role": role,
        "categoryId": categoryId
      };
}
