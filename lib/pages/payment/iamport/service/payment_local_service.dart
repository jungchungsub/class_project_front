import 'package:finalproject_front/core/http_connector.dart';
import 'package:finalproject_front/core/util/response_util.dart';
import 'package:finalproject_front/pages/payment/iamport/dto/response/payment_resp_dto.dart';
import 'package:finalproject_front/pages/payment/iamport/core/iamport_token.dart';
import 'package:finalproject_front/pages/payment/iamport/core/payment_http_connector.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:http/http.dart';
import 'package:logger/logger.dart';

const secureStorage = FlutterSecureStorage();

class PaymentLocalService {
  final PaymentHttpConnector paymentHttpConnector = PaymentHttpConnector();

  Future<void> fetchJwtToken() async {
    String? deviceJwtToken = await secureStorage.read(key: "access_token");
    if (deviceJwtToken != null) {
      Response response = await paymentHttpConnector.getInitSession("/access_token", deviceJwtToken);
      PaymentRespDto responseDto = toPaymentRespDto(response);

      if (responseDto.code == 0) {
        IamportToken.successAuthentication(deviceJwtToken);
      }
    }
  }

  Future<void> fetchDeleteJwtToken() async {
    Logger().d("jwt remove");
    await secureStorage.delete(key: "jwtToken");
  }
}
