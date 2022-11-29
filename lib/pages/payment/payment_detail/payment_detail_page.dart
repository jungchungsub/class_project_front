import 'package:finalproject_front/pages/payment/payment_detail/components/class_name.dart';
import 'package:finalproject_front/pages/payment/payment_detail/components/class_time.dart';
import 'package:finalproject_front/pages/payment/payment_detail/components/payment_purpose.dart';
import 'package:finalproject_front/pages/payment/payment_detail/components/total_money.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:extended_image/extended_image.dart';

class PaymentDetailPage extends StatefulWidget {
  const PaymentDetailPage({Key? key}) : super(key: key);

  @override
  State<PaymentDetailPage> createState() => _PaymentDetailPageState();
}

class _PaymentDetailPageState extends State<PaymentDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: ListView(
        children: [
          ClassName(),
          Divider(
            thickness: 1,
            height: 0,
            color: const Color(0xff929AAB),
          ),
          _middleTitle("수강시간"),
          ClassTime(),
          _middleDivider(),
          _middleTitle("결제금액"),
          TotalMoney(),
          _middleDivider(),
          _middleTitle("결제방법"),
          SizedBox(height: 15),
          PaymentPurpose(),
          _middleDivider(),
          _agree(),
          _paymentButton(context, "/paymentCard"),
        ],
      ),
    );
  }

  Padding _paymentButton(context, String path) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(height: 50),
        child: TextButton(
          style: TextButton.styleFrom(backgroundColor: Color(0xff4880ED)),
          onPressed: () {
            Navigator.pushNamed(context, path);
            //Form에서 현재의 상태 값이 null이 아니라면 /home로 push 해준다.
          },
          child: Text(
            "50,000원 결제하기",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Padding _agree() {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, bottom: 24.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(CupertinoIcons.app),
              SizedBox(width: 10),
              Text(
                "주문 내용을 확인하였으며, 결제에 동의합니다.(필수)",
                style: TextStyle(fontSize: 14),
              )
            ],
          ),
        ],
      ),
    );
  }

  Padding _middleTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Text(
        "${text}",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Divider _middleDivider() {
    return Divider(
      thickness: 14,
      height: 0,
      color: const Color(0xffF0F0F0),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1.0,
      leading: Icon(
        CupertinoIcons.back,
        color: Colors.black,
      ),
      title: Text(
        "주문하기",
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
    );
  }
}
