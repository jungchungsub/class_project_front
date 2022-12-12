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
  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
      );
}
