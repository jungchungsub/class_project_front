class ProfileDetailRespDto {
  int id;
  String filePath;
  String introduction;
  String region;
  String certification;
  String careerYear;
  String career;
  UserDto userDto;

  ProfileDetailRespDto(
      {required this.id,
      required this.filePath,
      required this.introduction,
      required this.region,
      required this.certification,
      required this.careerYear,
      required this.career,
      required this.userDto});

  factory ProfileDetailRespDto.fromJson(Map<String, dynamic> json) => ProfileDetailRespDto(
        id: json["id"],
        filePath: json["filePath"],
        introduction: json["introduction"],
        region: json["region"],
        certification: json["certification"],
        careerYear: json["careerYear"],
        career: json["career"],
        userDto: json["userDto"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "filePath": filePath,
        "introduction": introduction,
        "region": region,
        "certification": certification,
        "careerYear": careerYear,
        "career": career,
        "userDto": userDto,
      };
}

class UserDto {
  int id;
  String username;

  UserDto({
    required this.id,
    required this.username,
  });

// json -> dynamic
  factory UserDto.fromJson(Map<String, dynamic> json) => UserDto(
        id: json["id"],
        username: json["username"],
      );

// dynamic -> json
  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
      };
}
