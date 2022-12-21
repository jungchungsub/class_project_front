class Category {
  int id;
  String name;

  Category({
    required this.id,
    required this.name,
  });

//to Json
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  // json -> dynamic
  // 가져올때 형식은 String "뷰티", "운동" -> Inter의 리스트 형식임
  // 이것을 Category로 만들어주어야함.
  // {interestList: []}
  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
      );
}
