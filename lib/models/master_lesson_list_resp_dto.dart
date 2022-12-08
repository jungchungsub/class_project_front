import 'package:finalproject_front/models/profile_detail_resp_dto.dart';

class MasterLessonRespDto {
  int id;
  String name;
  UserDto userDto;
  int price;
  String expiredAt;
  String photo;

  MasterLessonRespDto({
    required this.id,
    required this.name,
    required this.userDto,
    required this.price,
    required this.expiredAt,
    required this.photo,
  });
}

class UserDto {
  String username;

  UserDto({required this.username});
}

List<MasterLessonRespDto> masterLessonList = [
  MasterLessonRespDto(
    id: 1,
    name: "깔끔하고 감각적인 최고의 홈페이지를 제작해드립니다.",
    userDto: UserDto(username: "박지성"),
    price: 10000,
    expiredAt: "2022.12.07",
    photo: "https://picsum.photos/201",
  ),
  MasterLessonRespDto(
    id: 2,
    name: "깔끔하고 감각적인 최고의 홈페이지를 제작해드립니다.",
    userDto: UserDto(username: "유리아"),
    price: 20000,
    expiredAt: "2022.12.07",
    photo: "https://picsum.photos/202",
  ),
  MasterLessonRespDto(
    id: 3,
    name: "깔끔하고 감각적인 최고의 홈페이지를 제작해드립니다.",
    userDto: UserDto(username: "김연아"),
    price: 30000,
    expiredAt: "2022.12.07",
    photo: "https://picsum.photos/203",
  ),
  MasterLessonRespDto(
    id: 4,
    name: "깔끔하고 감각적인 최고의 홈페이지를 제작해드립니다.",
    userDto: UserDto(username: "이현성"),
    price: 40000,
    expiredAt: "2022.12.07",
    photo: "https://picsum.photos/204",
  ),
];
