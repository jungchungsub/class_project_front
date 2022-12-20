import 'dart:convert';

import 'package:finalproject_front/core/util/response_util.dart';
import 'package:finalproject_front/pages/payment/iamport/dto/request/payment_cancel_req_dto.dart';
import 'package:finalproject_front/pages/payment/iamport/dto/request/payment_login_dto.dart';
import 'package:finalproject_front/pages/payment/iamport/dto/response/payment_resp_dto.dart';
import 'package:finalproject_front/pages/payment/iamport/core/iamport_token.dart';
import 'package:finalproject_front/pages/payment/iamport/core/payment_http_connector.dart';
import 'package:finalproject_front/service/local_service.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

class PaymentCancelService {
  final PaymentHttpConnector httpConnector = PaymentHttpConnector();

  Future<PaymentRespDto> fetchPaymentCancel(PaymentCancelReqDto paymentCancelReqDto) async {
    String requestBody = jsonEncode(paymentCancelReqDto.toJson());
    Logger().d("requestBody : ${requestBody.toString()}");
    Logger().d("IamportToken : ${IamportToken.acessesToken}");
    Response response = await httpConnector.postInitSession("payments/cancel", requestBody, IamportToken.acessesToken());

    PaymentRespDto responseDto = toPaymentRespDto(response);
    if (responseDto.code == 0) {
      Logger().d("환불 성공");
    }
    return responseDto;
  }

  Future<PaymentRespDto> fetchPaymentlogin(PaymentLoginReqDto paymentLoginReqDto) async {
    // 1. json 변환
    String requestBody = jsonEncode(paymentLoginReqDto.toJson());
    Logger().d("requestBody : $requestBody");

    // 2. 통신 시작
    Response response = await httpConnector.post("/users/getToken", requestBody);
    PaymentRespDto responseDto = toPaymentRespDto(response);

    Logger().d("responseDto : ${responseDto.response}");
    // 3. 토큰 받기
    String accessToken = responseDto.response["access_token"].toString();
    Logger().d("accessToken : $accessToken");
    // 4. 토큰을 디바이스와 세션에 저장
    await secureStorage.write(key: "access_token", value: accessToken); // 자동 로그인시 필요

    Logger().d("토큰 확인 : $accessToken");

    IamportToken.successAuthentication(accessToken);

    Logger().d("토큰 저장 ? : ${IamportToken.acessesToken()}");

    return responseDto; // ResponseDto 응답
  }
}
