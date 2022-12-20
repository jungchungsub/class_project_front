import 'dart:convert';

import 'package:finalproject_front/pages/payment/iamport/dto/response/payment_resp_dto.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

import '../../dto/response/respone_dto.dart';

ResponseDto toResponseDto(Response response) {
  Map<String, dynamic> responseMap = jsonDecode(response.body); // 문자열 -> Map
  responseMap['statusCode'] = response.statusCode; // Dto에 Status 코드 추가

  ResponseDto responseDto = ResponseDto.fromJson(responseMap); // Map -> Dart Class
  return responseDto;
}

//결제 기능 응답코드
PaymentRespDto toPaymentRespDto(Response response) {
  Map<String, dynamic> responseMap = jsonDecode(response.body); // 문자열 -> Map
  responseMap['statusCode'] = response.statusCode; // Dto에 Status 코드 추가

  PaymentRespDto paymentResponseDto = PaymentRespDto.fromJson(responseMap); // Map -> Dart Class
  return paymentResponseDto;
}
