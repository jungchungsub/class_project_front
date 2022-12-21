import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

LessonRespDto lessonRespDtoFromJson(String str) => LessonRespDto.fromJson(json.decode(str));

String lessonRespDtoToJson(LessonRespDto data) => json.encode(data.toJson());

class LessonRespDto {
  LessonRespDto({
    required this.expertDto,
    required this.lessonDtoList,
  });

  ExpertDto expertDto;
  List<LessonDtoList> lessonDtoList;

  factory LessonRespDto.fromJson(Map<String, dynamic> json) => LessonRespDto(
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
        lessonDeadLine: DateFormat("yyyy-mm-dd").parse(json["lessonDeadLine"]),
      );

  Map<String, dynamic> toJson() => {
        "lessonName": lessonName,
        "lessonPrice": lessonPrice,
        "lessonDeadLine": lessonDeadLine.toIso8601String(),
      };
}
