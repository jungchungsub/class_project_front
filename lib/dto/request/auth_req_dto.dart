class JoinReqDto {
  String username;
  String password;
  String email;
  String phoneNum;
  String role;
  //List<CategoryReqDto> category; // -> int로 받아달라고 함.

  JoinReqDto({required this.username, required this.password, required this.email, required this.phoneNum, required this.role});

// dynamic -> json
  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "email": email,
        "phoneNum": phoneNum,
        "role": role,
        // "category": category.map((e) => e.toJson()).toList()
      };
}
