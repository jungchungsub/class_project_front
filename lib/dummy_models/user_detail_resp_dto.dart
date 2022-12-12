import 'package:flutter/material.dart';

class UserDetailRespDto {
  int id;
  String username;
  String email;
  String phoneNum;

  UserDetailRespDto({
    required this.id,
    required this.username,
    required this.email,
    required this.phoneNum,
  });
}

List<UserDetailRespDto> userList = [
  UserDetailRespDto(
    id: 1,
    username: "정수영",
    email: "email@naver.com",
    phoneNum: "01012345678",
  ),
  UserDetailRespDto(
    id: 2,
    username: "정충섭",
    email: "babo@naver.com",
    phoneNum: "01044445555",
  ),
  UserDetailRespDto(
    id: 3,
    username: "조현나",
    email: "jojo@naver.com",
    phoneNum: "01011112222",
  ),
  UserDetailRespDto(
    id: 4,
    username: "이현성",
    email: "hyeon@naver.com",
    phoneNum: "01033334444",
  ),
  UserDetailRespDto(
    id: 5,
    username: "정해인",
    email: "충섭@naver.com",
    phoneNum: "01099998888",
  )
];
