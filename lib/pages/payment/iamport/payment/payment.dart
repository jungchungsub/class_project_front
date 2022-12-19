import 'package:finalproject_front/core/iamport/util/userCode.dart';
import 'package:flutter/material.dart';
import '../../../../dto/request/payment_data.dart';
import 'iamport_payment.dart';
import 'payment_test.dart';

class Payment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PaymentData data = ModalRoute.of(context)!.settings.arguments as PaymentData;

    return IamportPayment(
      appBar: AppBar(
        title: Text('아임포트 결제'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentTest()));
          },
        ),
      ),
      initialChild: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/iamport-logo.png'),
              Padding(padding: EdgeInsets.symmetric(vertical: 15)),
              Text('잠시만 기다려주세요...', style: TextStyle(fontSize: 20.0)),
            ],
          ),
        ),
      ),
      userCode: UserCode.getUserCodeByPg(data.pg),
      data: data,
      callback: (Map<String, String> result) {
        Navigator.pushReplacementNamed(context, '/result', arguments: result);
      },
    );
  }
}
