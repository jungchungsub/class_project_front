class SubscribeListRespDto {
  int id;
  UserDto userDto;
  LessonDto lessonDto;

  SubscribeListRespDto({
    required this.id,
    required this.userDto,
    required this.lessonDto,
  });
}

class UserDto {
  String username;

  UserDto({
    required this.username,
  });
}

class LessonDto {
  int id;
  String name;
  String photo;
  int price;

  LessonDto({
    required this.id,
    required this.name,
    required this.photo,
    required this.price,
  });
}

List<SubscribeListRespDto> subscribeListRespDto = [
  SubscribeListRespDto(
      id: 1,
      userDto: UserDto(username: "싸이"),
      lessonDto: LessonDto(
        id: 1,
        name: "깔끔하고 아름다운 웹 디자인을 해드립니다.",
        photo: "https://picsum.photos/201",
        price: 50000,
      )),
  SubscribeListRespDto(
      id: 2,
      userDto: UserDto(username: "박재상"),
      lessonDto: LessonDto(
        id: 1,
        name: "깔끔하고 아름다운 웹 디자인을 해드립니다.",
        photo: "https://picsum.photos/201",
        price: 50000,
      )),
  SubscribeListRespDto(
      id: 3,
      userDto: UserDto(username: "아이유"),
      lessonDto: LessonDto(
        id: 1,
        name: "깔끔하고 아름다운 웹 디자인을 해드립니다.",
        photo: "https://picsum.photos/201",
        price: 50000,
      ))
];
