import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/pages/payment/iamport/model/payment_data.dart';
import 'package:finalproject_front/pages/payment/iamport/util/userCode.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import '../iamport_payment.dart';
import 'payment_test.dart';

class Payment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PaymentData data = ModalRoute.of(context)!.settings.arguments as PaymentData;

    return IamportPayment(
      appBar: AppBar(
        backgroundColor: gPrimaryColor,
        title: Text('결제'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.popAndPushNamed(context, "/main");
          },
        ),
      ),
      initialChild: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.symmetric(vertical: 15)),
              Text('잠시만 기다려주세요...', style: TextStyle(fontSize: 20.0)),
            ],
          ),
        ),
      ),
      userCode: UserCode.getUserCodeByPg(data.pg),
      data: data,
      callback: (Map<String, String> result) {
        Logger().d("여기실행? 페이먼트");
        Logger().d("결제 확인 ${result}");
        Navigator.pushReplacementNamed(context, '/result', arguments: result);
      },
    );
  }
}
