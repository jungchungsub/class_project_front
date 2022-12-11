class ReviewRespDto {
  // 테스트를 위해서 임의로 작성, 이후에 지워야함.

  String username;
  String reviewContent;
  double lessonGrade;

  ReviewRespDto({
    required this.username,
    required this.reviewContent,
    required this.lessonGrade,
  });

  factory ReviewRespDto.fromJson(Map<String, dynamic> json) => ReviewRespDto(
        username: json["username"],
        reviewContent: json["reviewContent"],
        lessonGrade: json["lessonGrade"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "reviewContent": reviewContent,
        "lessonGrade": lessonGrade,
      };
}
