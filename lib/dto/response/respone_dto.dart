import 'dart:html';

import 'package:extended_image/extended_image.dart';

class ResponseDto {
  HttpStatus status;
  String? msg;
  dynamic data;

  ResponseDto({required this.status, required this.msg, required this.data});

  factory ResponseDto.fromJson(Map<String, dynamic> json) => ResponseDto(
        status: json["status"],
        msg: json["msg"],
        data: json["data"],
      );
  Map<String, dynamic> toJson() => {"msg": msg, "data": data};
}
