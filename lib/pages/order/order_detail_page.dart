import 'dart:async';
import 'dart:developer';

import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/pages/payment/iamport/payment/payment_test.dart';

import 'package:finalproject_front/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class OrderDetailPage extends StatefulWidget {
  const OrderDetailPage({Key? key}) : super(key: key);

  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  int counter = 1;
  int totalPrice = 5000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: ListView(
        children: [
          _buildClassName(),
          _buildDivider(),
          _buildTime(),
          _buildMiddleDivider(),
          _buildMoney(),
          _buildMiddleDivider(),
          _buildPaymentPurpose(),
          _buildMiddleDivider(),
          _buildAgree(),
          // _buildPaymentButton(context, "/paymentCard")
          _buildPaymentButton(context),
        ],
      ),
    );
  }

  Container _buildMoney() {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 20, right: 20),
                child: Text(
                  "결제금액",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "총 서비스 금액",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xff787272)),
                    ),
                    Text(
                      "${totalPrice}원",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xff787272)),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "쿠폰 할인",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xff787272)),
                    ),
                    Text(
                      "0원",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xff787272)),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Divider(
                  thickness: 1,
                  height: 0,
                  color: const Color(0xffF0F0F0),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "총 결제금액",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${totalPrice}원",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xff4880ED)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _buildTime() {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 20, right: 20),
            child: Row(
              children: [
                Text(
                  "수강시간",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: const Color(0xffEAF2FD),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "1회당 레슨시간(분)",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "105분",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "레슨 횟수",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "10회",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("$totalPrice", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Container(
                        width: 120,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  counter--;
                                  totalPrice -= 5000;
                                });
                              },
                              child: Container(
                                color: Color(0xffF3F3F3),
                                child: Icon(CupertinoIcons.minus),
                              ),
                            ),
                            Text("${counter}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  counter++;
                                  totalPrice += 5000;
                                });
                              },
                              child: Container(
                                color: Color(0xffF3F3F3),
                                child: Icon(CupertinoIcons.add),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding _buildClassName() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 10, bottom: 20, left: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 250,
                    child: Text(
                      "유튜브로 홈트하기 - 전세계의 운동 영상을",
                      style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text("드록바쌤", style: TextStyle(fontSize: 14, color: const Color(0xff787272), fontWeight: FontWeight.bold)),
                  )
                ],
              ),
              Container(
                height: 70,
                width: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(image: NetworkImage("https://picsum.photos/200"), fit: BoxFit.cover),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

//, String routePath
  Container _buildPaymentButton(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: ConstrainedBox(
          constraints: BoxConstraints.tightFor(height: 50),
          child: TextButton(
            style: TextButton.styleFrom(backgroundColor: Color(0xff4880ED), minimumSize: Size(340, 50)),
            onPressed: () {
              // Navigator.pushNamed(context, routePath);
              //Form에서 현재의 상태 값이 null이 아니라면 /home로 push 해준다.
              Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentTest()));
            },
            child: Text(
              "${totalPrice}원 결제하기",
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  Divider _buildDivider() {
    return Divider(
      thickness: 1,
      height: 0,
      color: const Color(0xff929AAB),
    );
  }

  Divider _buildMiddleDivider() {
    return Divider(
      thickness: 14,
      height: 0,
      color: const Color(0xffF0F0F0),
    );
  }

  AppBar _buildAppbar() {
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

class _buildPaymentPurpose extends StatefulWidget {
  const _buildPaymentPurpose({Key? key}) : super(key: key);

  @override
  State<_buildPaymentPurpose> createState() => __buildPaymentPurposeState();
}

class __buildPaymentPurposeState extends State<_buildPaymentPurpose> {
  bool? _ischecked = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 20, right: 20),
            child: Row(
              children: [
                Text(
                  "결제방법",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(height: gap_l),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Checkbox(
                        value: _ischecked,
                        onChanged: (bool? value) {
                          setState(() {
                            this._ischecked = value;
                          });
                        }),
                    SizedBox(
                      width: gap_l,
                    ),
                    Text(
                      "일반결제",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff8A8A8A),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: gap_l),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xffF0F0F0), width: 3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, left: 4, bottom: 10, right: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xffF0F0F0), width: 3),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8, right: 32, bottom: 8, left: 32),
                            child: Text(
                              "신용카드",
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xffF0F0F0), width: 3),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8, right: 32, bottom: 8, left: 32),
                            child: Text(
                              "무통장 입금",
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: gap_l),
                Padding(
                  padding: const EdgeInsets.only(bottom: gap_l),
                  child: Row(
                    children: [
                      Checkbox(
                          value: _ischecked,
                          onChanged: (bool? value) {
                            setState(() {
                              this._ischecked = value!;
                            });
                          }),
                      SizedBox(
                        width: gap_l,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset("assets/kakaoPay.png", fit: BoxFit.cover, height: 30),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: gap_l),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _buildAgree extends StatefulWidget {
  const _buildAgree({Key? key}) : super(key: key);

  @override
  State<_buildAgree> createState() => __buildAgreeState();
}

class __buildAgreeState extends State<_buildAgree> {
  bool? _ischecked = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, bottom: 12.0, left: 15, right: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                  value: _ischecked,
                  onChanged: (bool? value) {
                    setState(() {
                      this._ischecked = value;
                    });
                  }),
              SizedBox(width: gap_m),
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
}
