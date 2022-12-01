import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/pages/user/user_coupon/components/coupon_button.dart';
import 'package:finalproject_front/pages/user/user_coupon/components/coupon_list.dart';
import 'package:finalproject_front/pages/user/user_coupon/components/coupon_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class UserCouponPage extends StatelessWidget {
  const UserCouponPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    CouponTextFormField(text: "쿠폰"),
                    CouponButton(),
                  ],
                ),
                SizedBox(height: 20),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: "사용 가능한 쿠폰 ",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: "12",
                          style: TextStyle(
                              fontSize: 16,
                              color: gButtonOffColor,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                _buildCouponLists()
              ],
            ),
          )
        ],
      ),
    );
  }

  Column _buildCouponLists() {
    return Column(
      children: [
        CouponList(
            price: "10,000원",
            number: "14",
            title: "신규회원 디자인 1만원 할인",
            content: "30,000원 이상 구매시 최대 10",
            date: "2022.12.07 15:50까지"),
        CouponList(
            price: "10,000원",
            number: "14",
            title: "신규회원 디자인 1만원 할인",
            content: "30,000원 이상 구매시 최대 10",
            date: "2022.12.07 15:50까지"),
        CouponList(
            price: "10,000원",
            number: "14",
            title: "신규회원 디자인 1만원 할인",
            content: "30,000원 이상 구매시 최대 10",
            date: "2022.12.07 15:50까지"),
        CouponList(
            price: "10,000원",
            number: "14",
            title: "신규회원 디자인 1만원 할인",
            content: "30,000원 이상 구매시 최대 10",
            date: "2022.12.07 15:50까지"),
        CouponList(
            price: "10,000원",
            number: "14",
            title: "신규회원 디자인 1만원 할인",
            content: "30,000원 이상 구매시 최대 10",
            date: "2022.12.07 15:50까지"),
      ],
    );
  }

  AppBar _buildAppbar(BuildContext context) {
    return AppBar(
      elevation: 1.0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          CupertinoIcons.back,
          color: Colors.black,
          size: 26,
        ),
      ),
      centerTitle: true,
      title: TextButton(
        onPressed: () {},
        child: Text(
          "쿠폰",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
