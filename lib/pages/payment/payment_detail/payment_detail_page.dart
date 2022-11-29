import 'package:finalproject_front/pages/payment/payment_detail/components/class_name.dart';
import 'package:finalproject_front/pages/payment/payment_detail/components/class_time.dart';
import 'package:finalproject_front/pages/payment/payment_detail/components/payment_button.dart';
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
          ClassTime(),
          _middleDivider(),
          TotalMoney(),
          _middleDivider(),
          PaymentPurpose(),
          _middleDivider(),
          PaymentButton(path: "/paymentCard"),
        ],
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
