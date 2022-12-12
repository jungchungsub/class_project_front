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

List<SearchLessonRespDto> searchLessonRespDto = [
  SearchLessonRespDto(
    id: 1,
    name: "깔끔하고 아름다운 웹디자인을 해드립니다아아",
    photo: "https://picsum.photos/200",
    price: 50000,
  ),
  SearchLessonRespDto(
    id: 2,
    name: "아름답고 깔끕한 웹디자인을 해드립니다아아.",
    photo: "https://picsum.photos/201",
    price: 10000,
  ),
  SearchLessonRespDto(
    id: 3,
    name: "아름답고 깔끕한 웹디자인을 해드립니다아아.",
    photo: "https://picsum.photos/202",
    price: 20000,
  ),
  SearchLessonRespDto(
    id: 4,
    name: "아름답고 깔끕한 웹디자인을 해드립니다아아.",
    photo: "https://picsum.photos/203",
    price: 30000,
  ),
  SearchLessonRespDto(
    id: 5,
    name: "아름답고 깔끕한 웹디자인을 해드립니다아아.",
    photo: "https://picsum.photos/204",
    price: 30000,
  ),
  SearchLessonRespDto(
    id: 5,
    name: "아름답고 깔끕한 웹디자인을 해드립니다아아.",
    photo: "https://picsum.photos/205",
    price: 30000,
  ),
  SearchLessonRespDto(
    id: 5,
    name: "아름답고 깔끕한 웹디자인을 해드립니다아아.",
    photo: "https://picsum.photos/206",
    price: 30000,
  )
];
