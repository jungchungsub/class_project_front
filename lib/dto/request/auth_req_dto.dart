import 'category_req_dto.dart';
import 'package:get/get.dart';

class JoinReqDto {
  String username;
  String password;
  String email;
  String phoneNum;
  String role;
  // List<int>? categoryId;
  //List<int> categoryId = category.map((category) => category.id).toList();

  JoinReqDto({
    required this.username,
    required this.password,
    required this.email,
    required this.phoneNum,
    required this.role,
  });

// dynamic -> json
  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "email": email,
        "phoneNum": phoneNum,
        "role": role,
        // "categoryId": categoryId,
      };
}

class LoginReqDto {
  String username;
  String password;

  LoginReqDto({
    required this.username,
    required this.password,
  });
  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
      };
}

class UpdateUserReqDto {
  String password;
  String email;
  String phoneNum;
  List<int> categoryIds;

  UpdateUserReqDto({
    required this.password,
    required this.email,
    required this.phoneNum,
    required this.categoryIds,
  });

  Map<String, dynamic> toJson() => {
        "password": password,
        "email": email,
        "phoneNum": phoneNum,
        "categoryIds": categoryIds,
      };
}
