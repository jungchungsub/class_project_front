import 'package:finalproject_front/domain/user.dart';
import 'package:finalproject_front/dummy_models/profile_detail_resp_dto.dart';

class ProfileDetailRespDto {
  int id;
  String filePath;
  String introduction;
  String region;
  String certification;
  String careerYear;
  String career;
  User user;

  ProfileDetailRespDto(
      {required this.id,
      required this.filePath,
      required this.introduction,
      required this.region,
      required this.certification,
      required this.careerYear,
      required this.career,
      required this.user});

  factory ProfileDetailRespDto.fromJson(Map<String, dynamic> json) => ProfileDetailRespDto(
        id: json["id"],
        filePath: json["filePath"],
        introduction: json["introduction"],
        region: json["region"],
        certification: json["certification"],
        careerYear: json["careerYear"],
        career: json["career"],
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "filePath": filePath,
        "introduction": introduction,
        "region": region,
        "certification": certification,
        "careerYear": careerYear,
        "career": career,
        "user": user,
      };
}
