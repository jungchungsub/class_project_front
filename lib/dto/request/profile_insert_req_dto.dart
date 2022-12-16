// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

ProfileInsertReqDto welcomeFromJson(String str) => ProfileInsertReqDto.fromJson(json.decode(str));

String welcomeToJson(ProfileInsertReqDto data) => json.encode(data.toJson());

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
