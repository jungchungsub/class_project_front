class Review {
  int id;
  String username;
  String reviewContent;
  double? lessonGrade;

  Review({
    required this.id,
    required this.username,
    required this.reviewContent,
    this.lessonGrade,
  });
}

List<Review> reviewList = [
  Review(
    id: 1,
    username: "정충섭",
    reviewContent: "너무좋았어요",
    lessonGrade: 4.5,
  ),
  Review(
    id: 2,
    username: "아이유",
    reviewContent: "너무좋았어요감사합니다아아아아아아아아아아아아아아아아",
    lessonGrade: 4.5,
  ),
  Review(
    id: 3,
    username: "이현성",
    reviewContent: "너무좋았어요",
    lessonGrade: 4.5,
  ),
  Review(
    id: 4,
    username: "정충섭",
    reviewContent: "너무좋았어요",
    lessonGrade: 4.5,
  ),
  Review(
    id: 5,
    username: "정충섭",
    reviewContent: "너무좋았어요",
    lessonGrade: 4.5,
  ),
];
