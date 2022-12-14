class LessonReqDto {
  String name;
  String photo;
  int price;
  String place;
  int lessonTime;
  int lessonCount;
  String possibleDays;
  String curriculum;
  String policy;
  String deadline;
  int categoryId;
  // List<int>? categoryId;
  //List<int> categoryId = category.map((category) => category.id).toList();

  LessonReqDto({
    required this.name,
    required this.photo,
    required this.price,
    required this.place,
    required this.lessonTime,
    required this.lessonCount,
    required this.possibleDays,
    required this.curriculum,
    required this.policy,
    required this.deadline,
    required this.categoryId,
  });

// dynamic -> json
  Map<String, dynamic> toJson() => {
        "name": name,
        "photo": photo,
        "price": price,
        "place": place,
        "lessonTime": lessonTime,
        "lessonCount": lessonCount,
        "possibleDays": possibleDays,
        "curriculum": curriculum,
        "policy": policy,
        "deadline": deadline,
        "categoryId": categoryId,
        // "categoryId": categoryId,
      };
}
