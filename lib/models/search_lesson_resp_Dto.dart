class SearchLessonRespDto {
  int id;
  String name;
  String photo;
  int price;

  SearchLessonRespDto({
    required this.id,
    required this.name,
    required this.photo,
    required this.price,
  });
}

List<SearchLessonRespDto> userList = [
  SearchLessonRespDto(
    id: 1,
    name: "이현성",
    photo: "https://picsum.photos/200",
    price: 50000,
  ),
  SearchLessonRespDto(
    id: 2,
    name: "정충섭",
    photo: "https://picsum.photos/201",
    price: 10000,
  ),
  SearchLessonRespDto(
    id: 3,
    name: "정수영",
    photo: "https://picsum.photos/202",
    price: 20000,
  ),
  SearchLessonRespDto(
    id: 4,
    name: "조현나",
    photo: "https://picsum.photos/203",
    price: 30000,
  )
];
