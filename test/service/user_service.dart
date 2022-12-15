import 'package:finalproject_front/dto/request/profile_req_dto.dart';
import 'package:finalproject_front/dto/response/respone_dto.dart';
import 'package:finalproject_front/service/user_service.dart';

void main() async {
  await fetchInsertProfile_test();
}

Future<ResponseDto> fetchInsertProfile_test() async {
  String jwtToken =
      "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJleHBlcnQiLCJyb2xlIjoiRVhQRVJUIiwiaWQiOjQsImV4cCI6MTY3MTg4NjUzNn0.yRKQBExeTBwaM-RZxLeTT2rIoX29OqmU1FM6ePcm5UiTN81yXhRUkEyTwdIxZsyLyNuYYCoqKzo7SFG8r0HP7A";
  UserService userService = UserService();
  int userId = 1;
  List<String>? filePath = ["/9j/4AAQSkZJRgABAQAASABIAAD/4QBYR"];
  ProfileInsertReqDto profileInsertReqDto = ProfileInsertReqDto(
      filePath: filePath, introduction: "자기소개 테스트", region: "지역 테스트", certification: "학력전공 테스트", careerYear: "총 경력기간 테스트", career: "경력사항 테스트");
  ResponseDto responseDto = await userService.fetchInsertProfile(userId, profileInsertReqDto);
  return responseDto;
}
