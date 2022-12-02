import 'package:finalproject_front/pages/category/category_detail_page.dart';
import 'package:finalproject_front/pages/customer/customer_service_page.dart';

import 'package:finalproject_front/pages/chat/chat_list_page.dart';

import 'package:finalproject_front/pages/chat/chat_list_page.dart';

import 'package:finalproject_front/pages/lesson/lesson_review_insert_page.dart';
import 'package:finalproject_front/pages/lesson/lesson_update_page.dart';

import 'package:finalproject_front/pages/lesson/lesson_detail_page.dart';

import 'package:finalproject_front/pages/chat/chat_list_page.dart';

import 'package:finalproject_front/pages/lesson/lesson_detail_page.dart';

import 'package:finalproject_front/pages/chat/chat_list_page.dart';

import 'package:finalproject_front/pages/lesson/lesson_detail_page.dart';
import 'package:finalproject_front/pages/lesson/lesson_list_page.dart';
import 'package:finalproject_front/pages/lesson/lesson_review_insert_page.dart';

import 'package:finalproject_front/pages/main_page.dart';
import 'package:finalproject_front/pages/order/order_detail/order_detail_page.dart';

import 'package:finalproject_front/pages/payment/payment_card/payment_card_page.dart';
import 'package:finalproject_front/pages/payment/payment_detail/payment_detail_page.dart';
import 'package:finalproject_front/pages/payment/payment_installment_list/payment_installment_list_page.dart';
import 'package:finalproject_front/pages/payment/payment_sales_detail/payment_sales_detail_pages.dart';

import 'package:finalproject_front/pages/search/search_main/search_main_page.dart';

import 'package:finalproject_front/pages/sign/join_division_page/join_division_page.dart';
import 'package:finalproject_front/pages/sign/join_page/join_page.dart';
import 'package:finalproject_front/pages/sign/login_division_page/login_division_page.dart';
import 'package:finalproject_front/pages/sign/login_page/login_page.dart';

import 'package:finalproject_front/pages/user/user_coupon/user_coupon_page.dart';
import 'package:finalproject_front/pages/user/user_detail/user_login_my_page.dart';
import 'package:finalproject_front/pages/user/user_profile_detail/user_profile_detail_page.dart';
import 'package:finalproject_front/pages/user/user_profile_insert/user_profile_insert_page.dart';
import 'package:finalproject_front/pages/user/user_update/user_update_page.dart';
import 'package:finalproject_front/theme.dart';
import 'package:flutter/material.dart';

import 'pages/lesson/lesson_list_page.dart';

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
        // 라우팅 주소의 가장 앞에는 동사,명사

        "/main": (context) => MainPage(),
        "/loginDivision": (context) => LoginDivisionPage(),
        "/login": (context) => LoginPage(),
        "/join": (context) => JoinPage(),
        "/joinDivision": (context) => JoinDivisionPage(),
        "/paymentDetail": (context) => PaymentDetailPage(),
        "/paymentCard": (context) => PaymentCardPage(),
        "/orderDetail": (context) => OrderDetailPage(),
        "/lessonDetail": (context) => LessonListPage(),
        "/categoryDetail": (context) => CategoryDetailPage(),

        "/loginMyPage": (context) => UserLoginMyPage(),
        "/profileDetail": (context) => UserProfileDetailPage(),
        "/lessonList": (context) => LessonListPage(),
        "/searchMain": (context) => SearchMainPage(),
        "/customerService": (context) => CustomerServicePage(),
        "/userCoupon": (context) => UserCouponPage(),
        "/profileInsert": (context) => UserProfileInsertPage(),
        "/paymentSalesDetail": (context) => PaymentSalesDetailPage(),
        "/paymentInstallmentList": (context) => PaymentInstallmentListPage(),
        "/lessonUpdate": (context) => LessonUpdatePage(),
        "/chatList": (context) => ChatListPage(),

        "/userUpdate": (context) => UserUpdatePage(),
        "/reviewInsert": (context) => LessonReviewInsertPage()
      },
      theme: theme(),
    );
  }
}
