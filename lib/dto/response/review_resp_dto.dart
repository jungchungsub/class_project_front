class ReviewRespDto {
  String reviewId;
  String username;
  String reviewContent;
  double lessonGrade;

  ReviewRespDto({
    required this.reviewId,
    required this.username,
    required this.reviewContent,
    required this.lessonGrade,
  });

  factory ReviewRespDto.fromJson(Map<String, dynamic> json) => ReviewRespDto(
        reviewId: json["reviewId"],
        username: json["username"],
        reviewContent: json["reviewContent"],
        lessonGrade: json["lessonGrade"],
      );

  Map<String, dynamic> toJson() => {
        "id": reviewId,
        "username": username,
        "reviewContent": reviewContent,
        "lessonGrade": lessonGrade,
      };
}
