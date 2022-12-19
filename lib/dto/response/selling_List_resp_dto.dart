import 'dart:convert';

SellingListRespDto SellingListRespDtoFromJson(String str) => SellingListRespDto.fromJson(json.decode(str));

String lessonRespDtoToJson(SellingListRespDto data) => json.encode(data.toJson());

class SellingListRespDto {
  SellingListRespDto({
    required this.expertDto,
    required this.lessonDtoList,
  });

  ExpertDto expertDto;
  List<LessonDtoList> lessonDtoList;

  factory SellingListRespDto.fromJson(Map<String, dynamic> json) => SellingListRespDto(
        expertDto: ExpertDto.fromJson(json["expertDto"]),
        lessonDtoList: List<LessonDtoList>.from(json["lessonDtoList"].map((x) => LessonDtoList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "expertDto": expertDto.toJson(),
        "lessonDtoList": List<dynamic>.from(lessonDtoList.map((x) => x.toJson())),
      };
}

class ExpertDto {
  ExpertDto({
    required this.expertName,
  });

  String expertName;

  factory ExpertDto.fromJson(Map<String, dynamic> json) => ExpertDto(
        expertName: json["expertName"],
      );

  Map<String, dynamic> toJson() => {
        "expertName": expertName,
      };
}

class LessonDtoList {
  LessonDtoList({
    required this.lessonName,
    required this.lessonPrice,
    required this.lessonDeadLine,
  });

  String lessonName;
  int lessonPrice;
  DateTime lessonDeadLine;

  factory LessonDtoList.fromJson(Map<String, dynamic> json) => LessonDtoList(
        lessonName: json["lessonName"],
        lessonPrice: json["lessonPrice"],
        lessonDeadLine: DateTime.parse(json["lessonDeadLine"]),
      );

  Map<String, dynamic> toJson() => {
        "lessonName": lessonName,
        "lessonPrice": lessonPrice,
        "lessonDeadLine": lessonDeadLine.toIso8601String(),
      };
}
