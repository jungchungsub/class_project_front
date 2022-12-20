<<<<<<< HEAD
=======
import 'package:finalproject_front/pages/auth/join_division_page.dart';
import 'package:finalproject_front/pages/auth/login_division_page.dart';
import 'package:finalproject_front/pages/auth/login_page.dart';
>>>>>>> d5556137c857de36204b35ed96ae3ed0ccb91e5e
import 'package:finalproject_front/pages/chat/chat_list_page.dart';
import 'package:finalproject_front/pages/chat/chat_room_page.dart';
import 'package:finalproject_front/pages/customer/customer_service_page.dart';
import 'package:finalproject_front/pages/lesson/lesson_client_page/lesson_client_page.dart';
<<<<<<< HEAD

import 'package:finalproject_front/pages/lesson/lesson_insert_page.dart';
import 'package:finalproject_front/pages/lesson/lesson_master_list/lesson_master_list.dart';
=======
import 'package:finalproject_front/pages/lesson/lesson_insert_page.dart';
>>>>>>> d5556137c857de36204b35ed96ae3ed0ccb91e5e
import 'package:finalproject_front/pages/lesson/lesson_review_insert_page.dart';
import 'package:finalproject_front/pages/main/home/home_page/home_page.dart';
import 'package:finalproject_front/pages/main_page.dart';
import 'package:finalproject_front/pages/payment/iamport/iamport_request/payment.dart';
import 'package:finalproject_front/pages/payment/payment_card_page.dart';
import 'package:finalproject_front/pages/payment/payment_detail_page.dart';
import 'package:finalproject_front/pages/payment/payment_installment_list_page.dart';
import 'package:finalproject_front/pages/payment/payment_sales_detail_pages.dart';
import 'package:finalproject_front/pages/search/searchList.dart';
import 'package:finalproject_front/pages/search/search_detail_page.dart';
import 'package:finalproject_front/pages/search/search_main_page.dart';
import 'package:finalproject_front/pages/subscribe/subscribe_page.dart';
import 'package:finalproject_front/pages/user/user_coupon_page.dart';
import 'package:finalproject_front/pages/user/user_login_my_page/user_login_my_page.dart';
import 'package:finalproject_front/pages/user/user_logout_my_page.dart';
import 'package:finalproject_front/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import 'domain/user_session.dart';
import 'pages/order/order_detail/order_detail_page.dart';
import 'service/local_service.dart';

Future<void> main() async {
  //  main메서드에서 비동기 메서드를 사용하기 위함.
  WidgetsFlutterBinding.ensureInitialized();
  await LocalService().fetchJwtToken();
  runApp(
    ProviderScope(
      child: const MyApp(),
    ),
  );
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Logger().d("main 실행됨");
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      initialRoute: "/main",
      routes: {
        // 라우팅 주소의 가장 앞에는 동사,명사

        "/main": (context) => MainPage(),
        "/loginDivision": (context) => LoginDivisionPage(),
        "/login": (context) => LoginPage(),
        "/home": (context) => HomePage(),
        "/joinDivision": (context) => JoinDivisionPage(),
        "/paymentDetail": (context) => PaymentDetailPage(),
        "/paymentCard": (context) => PaymentCardPage(),
        "/orderDetail": (context) => OrderDetailPage(),
        "/loginMyPage": (context) => UserLoginMyPage(),
        "/logoutMyPage": (context) => UserLogoutMyPage(),
<<<<<<< HEAD
        "/lessonClientList": (context) => LessonClientListPage(userId: UserSession.user.id), //더미 적용

        // "/lessonExpertList": (context) => LessonMasterListPage(), //더미적용

=======
        "/lessonClientList": (context) => LessonClientListPage(),
>>>>>>> d5556137c857de36204b35ed96ae3ed0ccb91e5e
        "/searchPage": (context) => SearchPage(),
        "/customerService": (context) => CustomerServicePage(),
        "/userCoupon": (context) => UserCouponPage(),
        "/paymentSalesDetail": (context) => PaymentSalesDetailPage(),
        "/searchList": (context) => SearchListPage(),
        "/paymentInstallmentList": (context) => PaymentInstallmentListPage(),
<<<<<<< HEAD

=======
>>>>>>> d5556137c857de36204b35ed96ae3ed0ccb91e5e
        "/chatList": (context) => ChatListPage(),
        "/subscribePage": (context) => SubscribePage(userId: UserSession.user.id),
        "/reviewInsert": (context) => LessonReviewInsertPage(),
        "/searchDetail": (context) => SearchDetailPage(), // 더미 적용
        "/lessonInsert": (context) => LessonInsertPage(),
        "/chatroom": (context) => ChatRoomPage(),
        "/payment": (context) => Payment()
      },
      theme: theme(),
    );
  }
}
