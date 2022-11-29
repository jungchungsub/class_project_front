import 'package:finalproject_front/pages/payment/payment_inform/components/email_text_form_field.dart';
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
          _paymentInform(),
          _divider(),
          _cardSelect(context),
          _installment(),
          _emailForm(),
          Text(
            "구매 내용에 동의합니다.",
            style: TextStyle(fontSize: 12, color: Color(0xff6C6C6C)),
          ),
          _paymentButton(context, "/main")
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

  Container _paymentInform() {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(
              "결제정보",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Text(
                  "50,000원",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
        ],
      ),
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

  Padding _cardSelect(context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, right: 24, left: 24, bottom: 16),
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "카드사",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Container(
                  width: 210,
                  height: 50,
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color(0xffF0F0F0), width: 3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "토스",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                InkWell(
                  onTap: (() {
                    Navigator.pop(context);
                  }),
                  child: Container(
                    width: 120,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffEAF2FD),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text(
                        "카드 재선택",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4880ED),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Padding _installment() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "할부",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xffF0F0F0), width: 3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: PaymentPeriod(),
              width: 400,
              height: 50,
            )
          ],
        ),
      ),
    );
  }

  Padding _emailForm() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "이메일",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(height: 10),
            EmailTextFormField(text: "이메일")
          ],
        ),
      ),
    );
  }
}

Padding _paymentButton(context, String path) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextButton(
      style: TextButton.styleFrom(
          backgroundColor: Color(0xff4880ED), minimumSize: Size(340, 50)),
      onPressed: () {
        Navigator.pushNamed(context, path);
        //Form에서 현재의 상태 값이 null이 아니라면 /home로 push 해준다.
      },
      child: Text(
        "다음",
        style: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
