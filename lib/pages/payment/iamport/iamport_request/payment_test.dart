import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/domain/user_session.dart';
import 'package:finalproject_front/pages/order/order_detail_page.dart';
import 'package:finalproject_front/pages/payment/iamport/model/payment_data.dart';
import 'package:flutter/material.dart';

import 'package:logger/logger.dart';

import '../iamport_test.dart';

//내가 커스텀 가능한 페이지
class PaymentTest extends StatefulWidget {
  final MyOrderRespDto orderRespDto;
  PaymentTest({required this.orderRespDto});

  @override
  _PaymentTestState createState() => _PaymentTestState();
}

class _PaymentTestState extends State<PaymentTest> {
  final _formKey = GlobalKey<FormState>();
  late String pg = '${widget.orderRespDto.pg}'; // PG사
  late String payMethod = '${widget.orderRespDto.payMethod}'; // 결제수단
  String cardQuota = '0'; // 할부개월수
  bool digital = false; // 실물컨텐츠 여부
  bool escrow = false; // 에스크로 여부
  late String name = "${widget.orderRespDto.lessonName}"; // 주문명
  late String amount = "${widget.orderRespDto.totalPrice}"; // 결제금액
  String merchantUid = "green_${DateTime.now().millisecondsSinceEpoch}"; // 주문번호
  String buyerName = "홍길동"; // 구매자 이름
  String buyerTel = UserSession.user.phoneNum; // 구매자 전화번호

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('아임포트 결제 테스트'),
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
                decoration: InputDecoration(
                  labelText: 'PG사',
                ),
                readOnly: true,
                initialValue: "웹 표준 이니시스",
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: '결제수단',
                ),
                readOnly: true,
                initialValue: payMethod,
              ),
              TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                  labelText: '주문명',
                ),
                initialValue: name,
                validator: (value) => value!.isEmpty ? '주문명은 필수입력입니다' : null,
                onSaved: (String? value) {
                  name = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: '결제금액',
                ),
                readOnly: true,
                initialValue: amount,
                validator: (value) {
                  if (value!.isEmpty) {
                    return '결제금액은 필수입력입니다.';
                  }
                  if (value.length > 0) {
                    RegExp regex = RegExp(r'^\d+(\.\d+)?$');
                    if (!regex.hasMatch(value)) return '결제금액이 올바르지 않습니다.';
                  }
                  return null;
                },
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onSaved: (String? value) {
                  amount = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: '주문번호',
                ),
                readOnly: true,
                validator: (value) => value!.isEmpty ? '주문번호는 필수입력입니다' : null,
                initialValue: merchantUid,
                onSaved: (String? value) {
                  merchantUid = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: '이름',
                ),
                readOnly: true,
                initialValue: buyerName,
                onSaved: (String? value) {
                  buyerName = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: '전화번호',
                ),
                readOnly: true,
                initialValue: buyerTel,
                validator: (value) {
                  if (value!.length > 0) {
                    RegExp regex = RegExp(r'^[0-9]+$');
                    if (!regex.hasMatch(value)) return '전화번호가 올바르지 않습니다.';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                onSaved: (String? value) {
                  buyerTel = value!;
                },
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      print('creating payment data...');
                      Navigator.pushNamed(
                        context,
                        "/payment",
                        arguments: PaymentData(
                          pg: pg, // 뭘로 결제?
                          payMethod: payMethod, // 카드
                          name: name, // 상품이름
                          amount: num.parse(amount), // 가격
                          merchantUid: merchantUid, // 거래 고유번호
                          buyerName: buyerName, // 결제자 이름
                          buyerTel: buyerTel, // 결제자 번호
                          appScheme: 'flutterexample', // 모바일 웹뷰에서 외부앱 ( 결제창 ) 을 띄우기 위한 코드
                          niceMobileV2: true,
                          mRedirectUrl: null,
                        ),
                      );
                    }
                  },
                  child: Text(
                    '결제하기',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    foregroundColor: gButtonOffColor,
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
