class CategoryReqDto {
  int id;
  String name;

  CategoryReqDto({required this.id, required this.name});

//to Json
  Map<String, dynamic> toJson() => {"id": id, "name": name};

  // json -> dynamic
  factory CategoryReqDto.fromJson(Map<String, dynamic> json) => CategoryReqDto(
        id: json["id"],
        name: json["name"],
      );
}
