import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/size.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

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
            _buildPaymentInform(),
            _buildDivider(),
            _buildCardSelect(context),
            _buildInstallment(),
            _buildTextForm(),
            Text(
              "구매 내용에 동의합니다.",
              style: TextStyle(fontSize: 12, color: gSubTextColor),
            ),
            _buildPaymentButton(context, "/main")
          ],
        ),
      ),
    );
  }

  Padding _buildPaymentButton(BuildContext context, String routePath) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: Color(0xff4880ED), minimumSize: Size(340, 50)),
        onPressed: () {
          Navigator.pushNamed(context, routePath);
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

  Padding _buildTextForm() {
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
            SizedBox(height: gap_m),
            _buildTextFormField("이메일")
          ],
        ),
      ),
    );
  }

  TextFormField _buildTextFormField(String text) {
    return TextFormField(
      //1. 값이 없으면 plase enter some text 경고 화면 표시
      validator: (value) =>
          value!.isEmpty ? "${text}을 입력해주세요." : null, // 입력된 값은 value에 저장된다.
      // 2. 해당 textformfield가 비밀번호 입력 양식이라면 ***표시 처리 해줌.
      obscureText: text == "Password" ? true : false,
      decoration: InputDecoration(
          hintText: "${text}를 입력해주세요",
          hintStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: gBorderColor,
          ),
          //3. 기본 textFormfield 디자인 - enabledBorder
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: gBorderColor, width: 3.0),
            borderRadius: BorderRadius.circular(10),
          ),
          //4. 터치시 TextFormField디자인 - focusedBorder
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: gBorderColor, width: 3.0),
            borderRadius: BorderRadius.circular(10),
          ),
          //5. 에러 발생시 TextformField디자인 - errorBorder
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: gBorderColor, width: 3.0),
            borderRadius: BorderRadius.circular(10),
          ),

          //6. 에러 발생 후 손가락 터치 디자인  - focusedErrorBorder
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: gBorderColor, width: 3.0),
            borderRadius: BorderRadius.circular(10),
          )),
    );
  }

  Padding _buildInstallment() {
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
            SizedBox(height: gap_m),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: gBorderColor, width: 3),
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

  Padding _buildCardSelect(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, right: 20, left: 20, bottom: 16),
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
            SizedBox(height: gap_m),
            Row(
              children: [
                Container(
                  width: 220,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: gBorderColor, width: 3),
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
                SizedBox(width: gap_m),
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
                          color: gPrimaryColor,
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

  Container _buildPaymentInform() {
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
          SizedBox(height: gap_l),
        ],
      ),
    );
  }

  Divider _buildDivider() {
    return Divider(
      thickness: 14,
      color: gDivider,
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

class PaymentPeriod extends StatefulWidget {
  const PaymentPeriod({Key? key}) : super(key: key);

  @override
  State<PaymentPeriod> createState() => _PaymentPeriodState();
}

class _PaymentPeriodState extends State<PaymentPeriod> {
  final List<String> items = [
    '일시불',
    '2개월(무)',
    '3개월(무)',
    '4개월(무)',
    '5개월(무)',
    '6개월(무)',
    '7개월(무)',
    '8개월(무)',
    '9개월(무)',
    '10개월(무)',
    '11개월(무)',
    '12개월(무)',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          hint: Text(
            '일시불',
            style: TextStyle(
                fontSize: 14,
                color: gPrimaryColor,
                fontWeight: FontWeight.bold),
          ),
          items: items
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ))
              .toList(),
          value: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value as String;
            });
          },
        ),
      ),
    );
  }
}
