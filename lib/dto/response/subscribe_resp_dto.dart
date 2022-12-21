// import 'dart:convert';

// List<SubscribeRespDto> lessonRespDtoFromJson(String str) => List<SubscribeRespDto>.from(json.decode(str).map((x) => SubscribeRespDto.fromJson(x)));

// String lessonRespDtoToJson(List<SubscribeRespDto> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class SubscribeRespDto {
//   SubscribeRespDto({
//     required this.lessonId,
//     required this.lessonName,
//     required this.lessonPrice,
//     required this.avgGrade,
//     required this.totalReviews,
//     required this.subscribed,
//   });

//   int lessonId;
//   String lessonName;
//   int lessonPrice;
//   int avgGrade;
//   int totalReviews;
//   bool subscribed;

//   factory SubscribeRespDto.fromJson(Map<String, dynamic> json) => SubscribeRespDto(
//         lessonId: json["lessonId"],
//         lessonName: json["lessonName"],
//         lessonPrice: json["lessonPrice"],
//         avgGrade: json["avgGrade"],
//         totalReviews: json["totalReviews"],
//         subscribed: json["subscribed"],
//       );

//   Map<String, dynamic> toJson() => {
//         "lessonId": lessonId,
//         "lessonName": lessonName,
//         "lessonPrice": lessonPrice,
//         "avgGrade": avgGrade,
//         "totalReviews": totalReviews,
//         "subscribed": subscribed,
//       };
// }

class SubscribeRespDto {
  int lessonId;
  String lessonName;
  int lessonPrice;
  double avgGrade;
  int totalReviews;
  bool subscribed;

  SubscribeRespDto({
    required this.lessonId,
    required this.lessonName,
    required this.lessonPrice,
    required this.avgGrade,
    required this.totalReviews,
    required this.subscribed,
  });

  factory SubscribeRespDto.fromJson(Map<String, dynamic> json) => SubscribeRespDto(
        lessonId: json["lessonId"],
        lessonName: json["lessonName"],
        lessonPrice: json["lessonPrice"],
        avgGrade: json["avgGrade"],
        totalReviews: json["totalReviews"],
        subscribed: json["subscribed"],
      );
}
