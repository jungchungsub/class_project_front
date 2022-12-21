// import 'package:finalproject_front/pages/payment/iamport/dto/request/payment_login_dto.dart';
// import 'package:finalproject_front/pages/payment/iamport/payment_cancel_test.dart';
// import 'package:finalproject_front/pages/payment/iamport/iamport_request/payment_test.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:logger/logger.dart';

// import '../dto/request/payment_cancel_req_dto.dart';
// import '../dto/response/payment_resp_dto.dart';
// import '../../../../main.dart';
// import '../service/payment_cancel_service.dart';

// final paymentCancelController = Provider<PaymentCancelController>((ref) {
//   return PaymentCancelController(ref);
// });

// class PaymentCancelController {
//   final mContext = navigatorKey.currentContext;
//   final PaymentCancelService paymentCancelService = PaymentCancelService();
//   final Ref _ref;

//   PaymentCancelController(this._ref);

//   Future<void> login() async {
//     // 1. DTO 변환
//     PaymentLoginReqDto paymentLoginReqDto = PaymentLoginReqDto();
//     // 2. 통신 요청
//     PaymentRespDto responseDto = await paymentCancelService.fetchPaymentlogin(paymentLoginReqDto);
//     Logger().d("로그인  : ${responseDto.code}");
//     //3. 비지니스 로직 처리
//     if (responseDto.code == 0) {
//       Logger().d("로그인 성공시 바디 데이터 : ${responseDto.response}");
//       Navigator.push(mContext!, MaterialPageRoute(builder: (context) => PaymentCancelTest()));
//     } else {
//       ScaffoldMessenger.of(mContext!).showSnackBar(
//         const SnackBar(
//           backgroundColor: Color.fromRGBO(251, 82, 28, 0.8),
//           content: Text("아이디 또는 비밀번호가 다릅니다."),
//         ),
//       );
//     }
//   }

//   Future<void> paymentCancel(String impUid, String merchantUid, int amount, int taxFree, String checkSum, String reason) async {
//     PaymentCancelReqDto paymentsCancelReqDto =
//         PaymentCancelReqDto(impUid: impUid, merchantUid: merchantUid, amount: amount, taxFree: taxFree, checkSum: checkSum, reason: reason);

//     PaymentRespDto responseDto = await paymentCancelService.fetchPaymentCancel(paymentsCancelReqDto);
//     Logger().d("responseDto : ${responseDto.code}");
//     Logger().d("responseDto : ${responseDto.message}");
//     Logger().d("responseDto : ${responseDto.response}");
//     if (responseDto.code == 0) {
//       Navigator.push(mContext!, MaterialPageRoute(builder: (context) => PaymentTest()));
//     } else {
//       ScaffoldMessenger.of(mContext!).showSnackBar(
//         const SnackBar(
//           backgroundColor: Color.fromRGBO(251, 82, 28, 0.8),
//           content: Text("아이디 또는 비밀번호가 다릅니다."),
//         ),
//       );
//     }
//   }
// }
