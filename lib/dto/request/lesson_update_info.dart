class LessonUpdateInfo {
  LessonUpdateInfo(
      {required this.id,
      required this.name,
      required this.curriculum,
      required this.photo,
      required this.price,
      required this.place,
      required this.lessonTime,
      required this.lessonCount,
      required this.possibleDays,
      required this.policy,
      required this.deadline,
      required this.categoryId});

  int id;
  String name;
  String photo;
  String curriculum;
  int price;
  String place;
  int lessonTime;
  int lessonCount;
  String possibleDays;
  String policy;
  String deadline;
  int categoryId;
}
