import 'package:finalproject_front/pages/main_page.dart';
import 'package:finalproject_front/pages/payment/payment_card/payment_card_page.dart';
import 'package:finalproject_front/pages/payment/payment_detail/payment_detail_page.dart';

import 'package:finalproject_front/pages/payment/payment_inform/payment_inform_page.dart';

import 'package:finalproject_front/pages/sign/join_division_page/join_division_page.dart';
import 'package:finalproject_front/pages/sign/join_page/join_page.dart';
import 'package:finalproject_front/pages/sign/login_division_page/login_division_page.dart';
import 'package:finalproject_front/pages/sign/login_page/login_page.dart';
import 'package:finalproject_front/pages/user/user_inform/user_login_mypage.dart';
import 'package:finalproject_front/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/main",
      routes: {
        "/main": (context) => MainPage(),
        "/loginDivision": (context) => LoginDivisionPage(),
        "/login": (context) => LoginPage(),
        "/join": (context) => JoinPage(),
        "/joinDivision": (context) => JoinDivisionPage(),
        "/paymentDetail": (context) => PaymentDetailPage(),
        "/paymentCard": (context) => PaymentCardPage(),
        "/paymentInform": (context) => PaymentInformPage(),
        "/LoginMypage": (context) => UserLoginMypage()
      },
      theme: theme(),
    );
  }
}
