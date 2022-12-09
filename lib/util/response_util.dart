import 'dart:convert';

import 'package:http/http.dart';

import '../dto/response/respone_dto.dart';

ResponseDto toResponseDto(Response response) {
  Map<String, dynamic> responseMap = jsonDecode(response.body); // 문자열 -> Map

  ResponseDto responseDto = ResponseDto.fromJson(responseMap); // Map -> Dart Class
  return responseDto;
}
