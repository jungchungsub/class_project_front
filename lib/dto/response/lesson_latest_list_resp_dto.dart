class LessonLatestListRespDto {
  String name;
  int price;
  String photo;

  LessonLatestListRespDto({
    required this.name,
    required this.price,
    required this.photo,
  });

  factory LessonLatestListRespDto.fromJson(Map<String, dynamic> json) => LessonLatestListRespDto(
        name: json["name"],
        price: json["price"],
        photo: json["photo"],
      );
}
