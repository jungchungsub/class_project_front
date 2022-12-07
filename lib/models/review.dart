class Review {
  int id;
  String usernaeme;
  String reviewContent;
  double? lessonGrade;

  Review({
    required this.id,
    required this.usernaeme,
    required this.reviewContent,
    this.lessonGrade,
  });
}

List<Review> reviewList = [
  Review(
    id: 1,
    usernaeme: "정충섭",
    reviewContent: "너무좋았어요",
    lessonGrade: 4.5,
  ),
  Review(
    id: 2,
    usernaeme: "정충섭",
    reviewContent: "너무좋았어요",
    lessonGrade: 4.5,
  ),
  Review(
    id: 3,
    usernaeme: "정충섭",
    reviewContent: "너무좋았어요",
    lessonGrade: 4.5,
  ),
  Review(
    id: 4,
    usernaeme: "정충섭",
    reviewContent: "너무좋았어요",
    lessonGrade: 4.5,
  ),
  Review(
    id: 5,
    usernaeme: "정충섭",
    reviewContent: "너무좋았어요",
    lessonGrade: 4.5,
  ),
];
