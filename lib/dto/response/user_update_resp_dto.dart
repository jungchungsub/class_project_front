import 'dart:convert';

UserUpdateResponseDto responseDtoFromJson(String str) => UserUpdateResponseDto.fromJson(json.decode(str));

String responseDtoToJson(UserUpdateResponseDto data) => json.encode(data.toJson());

class UserUpdateResponseDto {
  UserUpdateResponseDto({
    required this.id,
    required this.username,
    required this.email,
    required this.phoneNum,
    required this.interestList,
  });

  int id;
  String username;
  String email;
  String phoneNum;
  List<InterestList> interestList;

  factory UserUpdateResponseDto.fromJson(Map<String, dynamic> json) => UserUpdateResponseDto(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        phoneNum: json["phoneNum"],
        interestList: List<InterestList>.from(json["interestList"].map((x) => InterestList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "phoneNum": phoneNum,
        "interestList": List<dynamic>.from(interestList.map((x) => x.toJson())),
      };
}

class InterestList {
  InterestList({
    required this.categoryName,
  });

  String categoryName;

  factory InterestList.fromJson(Map<String, dynamic> json) => InterestList(
        categoryName: json["categoryName"],
      );

  Map<String, dynamic> toJson() => {
        "categoryName": categoryName,
      };
}
