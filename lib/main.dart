import 'package:finalproject_front/pages/category/category_detail/category_detail_page.dart';
import 'package:finalproject_front/pages/lesson/lesson_detail/lesson_detail_page.dart';
import 'package:finalproject_front/pages/main_page.dart';
import 'package:finalproject_front/pages/order/order_list/order_list_page.dart';
import 'package:finalproject_front/pages/payment/payment_card/payment_card_page.dart';
import 'package:finalproject_front/pages/payment/payment_detail/payment_detail_page.dart';

import 'package:finalproject_front/pages/sign/join_division_page/join_division_page.dart';
import 'package:finalproject_front/pages/sign/join_page/join_page.dart';
import 'package:finalproject_front/pages/sign/login_division_page/login_division_page.dart';
import 'package:finalproject_front/pages/sign/login_page/login_page.dart';
import 'package:finalproject_front/pages/user/user_inform/user_login_my_page.dart';
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
        "/orderList": (context) => OrderListPage(),
        "/lessonDetail": (context) => LessonDetailPage(),
        "/categoryDetail": (context) => CategoryDetailPage(),
        "/LoginMypage": (context) => UserLoginMyPage()
      },
      theme: theme(),
    );
  }
}
