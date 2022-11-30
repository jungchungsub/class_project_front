import 'package:finalproject_front/pages/payment/payment_inform/components/card_select.dart';
import 'package:finalproject_front/pages/payment/payment_inform/components/email_text_form.dart';
import 'package:finalproject_front/pages/payment/payment_inform/components/email_text_form_field.dart';
import 'package:finalproject_front/pages/payment/payment_inform/components/installment.dart';
import 'package:finalproject_front/pages/payment/payment_inform/components/payment_button.dart';
import 'package:finalproject_front/pages/payment/payment_inform/components/payment_inform.dart';
import 'package:finalproject_front/pages/payment/payment_inform/components/payment_period.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PaymentInformPage extends StatelessWidget {
  const PaymentInformPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        children: [
          PaymentInform(),
          _divider(),
          CardSelect(),
          Installment(),
          EmailTextForm(),
          Text(
            "구매 내용에 동의합니다.",
            style: TextStyle(fontSize: 12, color: Color(0xff6C6C6C)),
          ),
          PaymentButton(path: "/main"),
        ],
      ),
    );
  }

  Divider _divider() {
    return Divider(
      thickness: 14,
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
        "결제하기",
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
