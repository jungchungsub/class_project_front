import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../controller/payment_cancle_controller.dart';
import 'iamport_test.dart';

class PaymentCancelTest extends ConsumerStatefulWidget {
  @override
  _CertificationTestState createState() => _CertificationTestState();
}

class _CertificationTestState extends ConsumerState<PaymentCancelTest> {
  final _formKey = GlobalKey<FormState>();
  String impUid = "impUid";
  String merchantUid = "merchantUid";
  String amount = "100";
  int taxFree = 0;

  final _impUid = TextEditingController();
  final _merchantUid = TextEditingController();
  final _amount = TextEditingController();
  final _reason = TextEditingController();

  String reason = "reason";

  @override
  Widget build(BuildContext context) {
    PaymentCancelController paymentCCT = ref.read(paymentCancelController);
    String checkSum = "100";
    print("checkSum : $checkSum");
    return Scaffold(
      appBar: AppBar(
        title: Text('아임포트 환불 테스트'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => IamportTest()));
          },
        ),
      ),
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 15),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _impUid,
                decoration: InputDecoration(
                  labelText: '아임포트 번호',
                ),
                onSaved: (String? value) {
                  impUid = value!;
                },
              ),
              TextFormField(
                controller: _merchantUid,
                decoration: InputDecoration(
                  labelText: '주문번호',
                ),
                validator: (value) => value!.isEmpty ? '주문번호는 필수입력입니다' : null,
                onSaved: (String? value) {
                  merchantUid = value!;
                },
              ),
              TextFormField(
                controller: _amount,
                decoration: InputDecoration(
                  labelText: '가격',
                ),
                onSaved: (value) {
                  amount = value!;
                },
              ),
              TextFormField(
                controller: _reason,
                decoration: InputDecoration(
                  labelText: '환불 이유',
                ),
                keyboardType: TextInputType.number,
                onSaved: (String? value) {
                  reason = value!;
                },
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (checkSum.toString() == amount.toString()) {
                        _formKey.currentState!.save();
                        paymentCCT.paymentCancel(
                            _impUid.text.trim(), _merchantUid.text.trim(), int.parse(_amount.text.trim()), taxFree, checkSum, _reason.text.trim());
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              actions: [
                                Text("거래했던 금액과 취소할 금액이 다릅니다."),
                              ],
                            );
                          },
                        );
                      }
                    }
                  },
                  child: Text(
                    '환불 하기',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: 0,
                    shadowColor: Colors.transparent,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
