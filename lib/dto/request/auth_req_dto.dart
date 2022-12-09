import 'category_req_dto.dart';

class JoinReqDto {
  String username;
  String password;
  String email;
  String phoneNum;
  String role;
  // List<CategoryReqDto> category;
  JoinReqDto({required this.username, required this.password, required this.email, required this.phoneNum, required this.role});

// dynamic -> json
  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "email": email,
        "phoneNum": phoneNum,
        "role": role,
        // "category": category.map((e) => e.toJson()).toList(), // list타입이기 때문에 한번에 처리
      };
}
