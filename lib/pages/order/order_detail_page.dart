import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/pages/lesson/lesson_detail_page/model/lesson_detail_page_model.dart';
import 'package:finalproject_front/pages/payment/iamport/iamport_request/payment_test.dart';
import 'package:finalproject_front/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:logger/logger.dart';

class MyOrderRespDto {
  MyOrderRespDto.single();
  String? lessonName;
  int? lessonCount;
  int? totalPrice;
  String? payMethod;
  String? pg;

  MyOrderRespDto({
    required this.lessonName,
    required this.lessonCount,
    required this.totalPrice,
    required this.payMethod,
    required this.pg,
  });
}

class OrderDetailPage extends StatefulWidget {
  LessonDetailPageModel? model;
  OrderDetailPage({required this.model, super.key});

  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  //기본 설정 값
  int count = 1;
  late int totalPrice = widget.model!.lessonRespDto.lessonDto.lessonPrice;

  void setPlus(int lessonPrice) {
    setState(() {
      count++;
      totalPrice += lessonPrice;
    });
  }

  void setMinus(int lessonPrice) {
    if (count > 0) {
      setState(() {
        count--;
        totalPrice -= lessonPrice;
      });
    } else if (count < 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("1개 미만은 구입 불가능합니다.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    MyOrderRespDto orderRespDto = MyOrderRespDto.single();

    return Scaffold(
      appBar: _buildAppbar(),
      body: ListView(
        children: [
          _buildClassName(), //완
          _buildDivider(),
          _buildTime(totalPrice: totalPrice, counter: count),
          _buildMiddleDivider(),
          _buildMoney(totalPrice: totalPrice),
          _buildMiddleDivider(),
          _buildPaymentPurpose(orderRespDto: orderRespDto),
          _buildMiddleDivider(),
          _buildAgree(),
          // _buildPaymentButton(context, "/paymentCard")
          _buildPaymentButton(context: context, count: count, totalPrice: totalPrice, orderRespDto: orderRespDto),
        ],
      ),
    );
  }

  Container _buildMoney({required int totalPrice}) {
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
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: gSubTextColor),
                    ),
                    Text(
                      "$totalPrice원",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: gSubTextColor),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "쿠폰 할인",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: gSubTextColor),
                    ),
                    Text(
                      "0원",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: gSubTextColor),
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
                        "$totalPrice원",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: gPrimaryColor),
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

  Container _buildTime({required int totalPrice, required int counter}) {
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
                              "${widget.model!.lessonRespDto.lessonDto.lessonTime}",
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
                              "${widget.model!.lessonRespDto.lessonDto.lessonCount}",
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
                                  setMinus(widget.model!.lessonRespDto.lessonDto.lessonPrice);
                                });
                              },
                              child: Container(
                                color: gContentBoxColor,
                                child: Icon(CupertinoIcons.minus),
                              ),
                            ),
                            Text("$counter", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            InkWell(
                              onTap: () {
                                setPlus(widget.model!.lessonRespDto.lessonDto.lessonPrice);
                              },
                              child: Container(
                                color: gContentBoxColor,
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

  Widget _buildClassName() {
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
                      "${widget.model?.lessonRespDto.lessonDto.lessonName}",
                      style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text("${widget.model!.lessonRespDto.profileDto.expertName}",
                        style: TextStyle(fontSize: 14, color: gSubTextColor, fontWeight: FontWeight.bold)),
                  )
                ],
              ),
              Container(
                height: 70,
                width: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(image: NetworkImage("https://picsum.photos/200"), fit: BoxFit.cover),
                  // image: DecorationImage(image: Image.asset(widget.model.lessonRespDto.lessonDto.filePath), fit: BoxFit.cover),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

//, String routePath
  Container _buildPaymentButton({required BuildContext context, required int totalPrice, required MyOrderRespDto orderRespDto, required int count}) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: ConstrainedBox(
          constraints: BoxConstraints.tightFor(height: 50),
          child: TextButton(
            style: TextButton.styleFrom(backgroundColor: Color(0xff4880ED), minimumSize: Size(340, 50)),
            onPressed: () {
              orderRespDto.lessonCount = count;
              orderRespDto.totalPrice = totalPrice;
              orderRespDto.lessonName = widget.model!.lessonRespDto.lessonDto.lessonName;
              orderRespDto.pg = "html5_inicis";
              Logger().d(" 버튼 누르기 전 확인 :${orderRespDto}");
              Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentTest(orderRespDto: orderRespDto)));
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
  final MyOrderRespDto orderRespDto;
  const _buildPaymentPurpose({required this.orderRespDto, Key? key}) : super(key: key);

  @override
  State<_buildPaymentPurpose> createState() => __buildPaymentPurposeState();
}

class __buildPaymentPurposeState extends State<_buildPaymentPurpose> {
  bool? _ischecked = false;
  bool? _isKakaoChecked = false;
  bool? _isNaverChecked = false;
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
                          widget.orderRespDto.payMethod = "card";
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
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: gap_l),
                      child: Row(
                        children: [
                          Checkbox(
                              value: _isKakaoChecked,
                              onChanged: (bool? value) {
                                widget.orderRespDto.payMethod = "kakaopay";
                                setState(() {
                                  this._isKakaoChecked = value!;
                                });
                              }),
                          SizedBox(
                            width: gap_m,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset("assets/kakaoPay.png", fit: BoxFit.cover, height: 30),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 50),
                    Padding(
                      padding: const EdgeInsets.only(bottom: gap_l),
                      child: Row(
                        children: [
                          Checkbox(
                              value: _isNaverChecked,
                              onChanged: (bool? value) {
                                widget.orderRespDto.payMethod = "naverpay";

                                setState(() {
                                  this._isNaverChecked = value!;
                                });
                              }),
                          SizedBox(
                            width: gap_m,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset("assets/naverpay.jpeg", fit: BoxFit.cover, height: 30),
                          ),
                        ],
                      ),
                    ),
                  ],
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
  bool? _checked = true;
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
                      this._checked = value;
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
