class Category {
  int id;
  String name;

  Category({required this.id, required this.name});

//to Json
  Map<String, dynamic> toJson() => {"id": id, "name": name};
}
