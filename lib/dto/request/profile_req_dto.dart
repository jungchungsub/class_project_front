import 'dart:convert';

ProfileInsertReqDto responseDtoFromJson(String str) => ProfileInsertReqDto.fromJson(json.decode(str));

String responseDtoToJson(ProfileInsertReqDto data) => json.encode(data.toJson());

class ProfileInsertReqDto {
  ProfileInsertReqDto({
    this.filePath,
    required this.introduction,
    required this.region,
    required this.certification,
    this.careerYear,
    required this.career,
  });

  String? filePath;
  String introduction;
  String region;
  String certification;
  String? careerYear;
  String career;

  factory ProfileInsertReqDto.fromJson(Map<String, dynamic> json) => ProfileInsertReqDto(
        filePath: json["filePath"],
        introduction: json["introduction"],
        region: json["region"],
        certification: json["certification"],
        careerYear: json["careerYear"],
        career: json["career"],
      );

  Map<String, dynamic> toJson() => {
        "filePath": filePath,
        "introduction": introduction,
        "region": region,
        "certification": certification,
        "careerYear": careerYear,
        "career": career,
      };
}
