class LessonCategoryListRespDto {
  CategoryDto categoryDto;
  LessonDto lessonDto;

  LessonCategoryListRespDto({
    required this.categoryDto,
    required this.lessonDto,
  });
}

class CategoryDto {
  String CategoryName;

  CategoryDto({
    required this.CategoryName,
  });
}

class LessonDto {
  int lessonId;
  String lessonName;
  String lessonPrice;
  String lessonImage;
  int lessonReviewsCount;
  double lessonAvgGrade;
  bool isSubscribed;

  LessonDto({
    required this.lessonId,
    required this.lessonName,
    required this.lessonPrice,
    required this.lessonImage,
    required this.lessonReviewsCount,
    required this.lessonAvgGrade,
    required this.isSubscribed,
  });
}

List<LessonCategoryListRespDto> lessonCategoryList = [
  LessonCategoryListRespDto(
    categoryDto: CategoryDto(CategoryName: "뷰티"),
    lessonDto: LessonDto(
      lessonId: 1,
      lessonName: "깔끔하고 아름다운 디자인을 해드립니다",
      lessonPrice: "50000",
      lessonImage: "https://picsum.photos/201",
      lessonReviewsCount: 5,
      lessonAvgGrade: 3.5,
      isSubscribed: false,
    ),
  ),
  LessonCategoryListRespDto(
    categoryDto: CategoryDto(CategoryName: "뷰티"),
    lessonDto: LessonDto(
      lessonId: 2,
      lessonName: "깔끔하고 아름다운 디자인을 해드립니다",
      lessonPrice: "50000",
      lessonImage: "https://picsum.photos/202",
      lessonReviewsCount: 5,
      lessonAvgGrade: 3.5,
      isSubscribed: false,
    ),
  ),
  LessonCategoryListRespDto(
    categoryDto: CategoryDto(CategoryName: "뷰티"),
    lessonDto: LessonDto(
      lessonId: 3,
      lessonName: "깔끔하고 아름다운 디자인을 해드립니다",
      lessonPrice: "50000",
      lessonImage: "https://picsum.photos/203",
      lessonReviewsCount: 5,
      lessonAvgGrade: 3.5,
      isSubscribed: false,
    ),
  ),
  LessonCategoryListRespDto(
    categoryDto: CategoryDto(CategoryName: "뷰티"),
    lessonDto: LessonDto(
      lessonId: 4,
      lessonName: "깔끔하고 아름다운 디자인을 해드립니다",
      lessonPrice: "50000",
      lessonImage: "https://picsum.photos/204",
      lessonReviewsCount: 5,
      lessonAvgGrade: 3.5,
      isSubscribed: false,
    ),
  ),
  LessonCategoryListRespDto(
    categoryDto: CategoryDto(CategoryName: "뷰티"),
    lessonDto: LessonDto(
      lessonId: 5,
      lessonName: "깔끔하고 아름다운 디자인을 해드립니다",
      lessonPrice: "50000",
      lessonImage: "https://picsum.photos/205",
      lessonReviewsCount: 5,
      lessonAvgGrade: 3.5,
      isSubscribed: false,
    ),
  )
];
