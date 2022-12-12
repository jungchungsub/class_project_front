import 'package:finalproject_front/dummy_models/profile_detail_resp_dto.dart';

class ProfileDetailRespDto {
  int id;
  String filePath;
  String introduction;
  String region;
  String certification;
  String careerYear;
  String career;

  ProfileDetailRespDto(
      {required this.id,
      required this.filePath,
      required this.introduction,
      required this.region,
      required this.certification,
      required this.careerYear,
      required this.career});

  factory ProfileDetailRespDto.fromJson(Map<String, dynamic> json) => ProfileDetailRespDto(
        id: json["id"],
        filePath: json["filePath"],
        introduction: json["introduction"],
        region: json["region"],
        certification: json["certification"],
        careerYear: json["careerYear"],
        career: json["career"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "filePath": filePath,
        "introduction": introduction,
        "region": region,
        "certification": certification,
        "careerYear": careerYear,
        "career": career,
      };
}
