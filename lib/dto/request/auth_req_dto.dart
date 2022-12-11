import 'category_req_dto.dart';
import 'package:get/get.dart';

class JoinReqDto {
  String? username;
  String? password;
  String? email;
  String? phoneNum;
  String? role;
  // List<int>? categoryId;
  //List<int> categoryId = category.map((category) => category.id).toList();

  JoinReqDto.origin();
  JoinReqDto({required this.username, required this.password, required this.email, required this.phoneNum, required this.role});

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
