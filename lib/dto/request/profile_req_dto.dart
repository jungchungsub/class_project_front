import 'dart:convert';

ProfileUpdateReqDto profileUpdateDtoFromJson(String str) => ProfileUpdateReqDto.fromJson(json.decode(str));

String profileUpdateDtoToJson(ProfileUpdateReqDto data) => json.encode(data.toJson());

class ProfileUpdateReqDto {
  ProfileUpdateReqDto.single();
  ProfileUpdateReqDto({
    this.filePath,
    this.introduction,
    this.region,
    this.certification,
    this.careerYear,
    this.career,
  });

  String? filePath;
  String? introduction;
  String? region;
  String? certification;
  String? careerYear;
  String? career;

  factory ProfileUpdateReqDto.fromJson(Map<String, dynamic> json) => ProfileUpdateReqDto(
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

ProfileInsertReqDto profileInsertFromJson(String str) => ProfileInsertReqDto.fromJson(json.decode(str));

String profileInsertToJson(ProfileInsertReqDto data) => json.encode(data.toJson());

class ProfileInsertReqDto {
  ProfileInsertReqDto.single();
  ProfileInsertReqDto({
    this.filePath,
    this.introduction,
    this.region,
    this.certification,
    this.careerYear,
    this.career,
  });

  String? filePath;
  String? introduction;
  String? region;
  String? certification;
  String? careerYear;
  String? career;

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
