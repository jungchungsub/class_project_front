// import 'dart:convert';

// LessonInsertReqDto lessonReqDtoFromJson(String str) => LessonInsertReqDto.fromJson(json.decode(str));

// String lessonReqDtoToJson(LessonInsertReqDto data) => json.encode(data.toJson());

// class LessonInsertReqDto {
//   LessonInsertReqDto.single();

//   LessonInsertReqDto({
//     this.name,
//     this.photo,
//     this.price,
//     this.place,
//     this.lessonTime,
//     this.lessonCount,
//     this.possibleDays,
//     this.curriculum,
//     this.policy,
//     this.deadline,
//     this.categoryId,
//   });

//   String? name;
//   String? photo;
//   int? price;
//   String? place;
//   int? lessonTime;
//   int? lessonCount;
//   String? possibleDays;
//   String? curriculum;
//   String? policy;

//   DateTime? deadline;
//   int? categoryId;

//   factory LessonInsertReqDto.fromJson(Map<String, dynamic> json) => LessonInsertReqDto(
//         name: json["name"],
//         photo: json["photo"],
//         price: json["price"],
//         place: json["place"],
//         lessonTime: json["lessonTime"],
//         lessonCount: json["lessonCount"],
//         possibleDays: json["possibleDays"],
//         curriculum: json["curriculum"],
//         policy: json["policy"],
//         deadline: DateTime.parse(json["deadline"]),
//         categoryId: json["categoryId"],
//       );

//   Map<String, dynamic> toJson() => {
//         "name": name,
//         "photo": photo,
//         "price": price,
//         "place": place,
//         "lessonTime": lessonTime,
//         "lessonCount": lessonCount,
//         "possibleDays": possibleDays,
//         "curriculum": curriculum,
//         "policy": policy,
//         "deadline": deadline?.toIso8601String(),
//         "categoryId": categoryId,
//       };
// }
