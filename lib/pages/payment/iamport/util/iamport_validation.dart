import 'package:finalproject_front/pages/payment/iamport/model/payment_data.dart';

class IamportValidation {
  bool isValid = true;
  String? errorMessage;

  IamportValidation(String userCode, PaymentData data, Function callback) {
    if (data.pg == 'syrup') {
      isValid = false;
      errorMessage = '해당 모듈은 해당 PG사를 지원하지 않습니다.';
      return;
    }
  }
  bool getIsValid() {
    return isValid;
  }

  String? getErrorMessage() {
    return errorMessage;
  }
}
