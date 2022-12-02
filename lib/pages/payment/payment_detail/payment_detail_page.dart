import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/pages/payment/payment_detail/components/card_select.dart';
import 'package:finalproject_front/pages/payment/payment_detail/components/email_text_form.dart';
import 'package:finalproject_front/pages/payment/payment_detail/components/installment.dart';
import 'package:finalproject_front/pages/payment/payment_detail/components/payment_button.dart';
import 'package:finalproject_front/pages/payment/payment_detail/components/payment_inform.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PaymentDetailPage extends StatelessWidget {
  const PaymentDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PaymentInform(),
            _buildDivider(),
            CardSelect(),
            Installment(),
            EmailTextForm(),
            Text(
              "구매 내용에 동의합니다.",
              style: TextStyle(fontSize: 12, color: gSubTextColor),
            ),
            PaymentButton(routePath: "/main"),
          ],
        ),
      ),
    );
  }

  Divider _buildDivider() {
    return Divider(
      thickness: 14,
      color: const Color(0xffF0F0F0),
    );
  }

  AppBar _buildAppbar(context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1.0,
      leading: IconButton(
          icon: Icon(
            CupertinoIcons.back,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          }),
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
