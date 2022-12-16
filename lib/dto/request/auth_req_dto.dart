import 'category_req_dto.dart';
import 'package:get/get.dart';

class JoinReqDto {
  JoinReqDto.single();

  String? username;
  String? password;
  String? email;
  String? phoneNum;
  String? role;
  List<int>? categoryId;

  JoinReqDto({
    this.username,
    this.password,
    this.email,
    this.phoneNum,
    this.role,
  });
// dynamic -> json
  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "email": email,
        "phoneNum": phoneNum,
        "role": role,
        "categoryId": categoryId,
      };
}

class LoginReqDto {
  LoginReqDto.single();

  String? username;
  String? password;

  LoginReqDto({
    this.username,
    this.password,
  });

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
      };
}

class UserUpdateReqDto {
  UserUpdateReqDto.single();

  String? password;
  String? email;
  String? phoneNum;
  List<int>? categoryIds;

  UserUpdateReqDto({
    this.password,
    this.email,
    this.phoneNum,
    this.categoryIds,
  });
  Map<String, dynamic> toJson() => {
        "password": password,
        "email": email,
        "phoneNum": phoneNum,
        "categoryIds": categoryIds,
      };
}
