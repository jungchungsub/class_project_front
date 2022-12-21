class CategoryReqDto {
  int id;

  CategoryReqDto({required this.id});

//to Json
  Map<String, dynamic> toJson() => {"id": id};

  // json -> dynamic
  factory CategoryReqDto.fromJson(Map<String, dynamic> json) => CategoryReqDto(
        id: json["id"],
      );
}
