class Profile {
  int id;
  String filePath;
  String introduction;
  String region;
  String certification;
  String carrerYear;
  String carrer;
  UserDto userDto;

  Profile({
    required this.id,
    required this.filePath,
    required this.introduction,
    required this.region,
    required this.certification,
    required this.carrerYear,
    required this.carrer,
    required this.userDto,
  });
}

class UserDto {
  String username;

  UserDto({
    required this.username,
  });
}

List<Profile> profileList = [
  Profile(
      id: 1,
      filePath: "assets/picture.jpg",
      introduction: "컴퓨터 공학과를 졸업하고, 부산에 살며, 개인정보 취급사 자격증을 갖고 있고 , 보안 외주를 위주로 작업하고있습니다.",
      region: "부산",
      certification: "개인정보취급사",
      carrerYear: "3년차",
      carrer: "컴퓨터공학과",
      userDto: UserDto(username: "정충섭")),
  Profile(
      id: 2,
      filePath: "assets/picture.jpg",
      introduction: "웹 개발을 작업하는 대구 사는 아이유 라고 합니다. ",
      region: "대구",
      certification: "정보처리기사",
      carrerYear: "7년차",
      carrer: "컴퓨터공학과",
      userDto: UserDto(username: "아이유")),
  Profile(
      id: 3,
      filePath: "assets/picture.jpg",
      introduction: "자기소개 작성하는 공간 컨벤션이 너무 어려워 나 좀 살려줘 머리가 터질 것 같아",
      region: "서울",
      certification: "개인정보취급사",
      carrerYear: "3년차",
      carrer: "컴퓨터공학과",
      userDto: UserDto(username: "호잇")),
  Profile(
      id: 4,
      filePath: "assets/picture.jpg",
      introduction: "자기소개 작성하는 공간 컨벤션이 너무 어려워 나 좀 살려줘 머리가 터질 것 같아",
      region: "고성",
      certification: "개인정보취급사",
      carrerYear: "신입",
      carrer: "컴퓨터공학과",
      userDto: UserDto(username: "호호"))
];
