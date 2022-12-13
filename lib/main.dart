import 'package:finalproject_front/core/util/move.dart';
import 'package:finalproject_front/pages/category/category_detail_page.dart';
import 'package:finalproject_front/pages/chat/chat_list_page.dart';
import 'package:finalproject_front/pages/customer/customer_service_page.dart';
import 'package:finalproject_front/pages/lesson/lesson_client_page.dart';
import 'package:finalproject_front/pages/lesson/lesson_detail_page/lesson_detail_page.dart';
import 'package:finalproject_front/pages/lesson/lesson_insert_page.dart';
import 'package:finalproject_front/pages/lesson/lesson_master_list.dart';
import 'package:finalproject_front/pages/lesson/lesson_review_insert_page.dart';
import 'package:finalproject_front/pages/lesson/lesson_update_page.dart';
import 'package:finalproject_front/pages/main/home/home_page/home_page.dart';
import 'package:finalproject_front/pages/main_page.dart';
import 'package:finalproject_front/pages/order/order_detail_page.dart';
import 'package:finalproject_front/pages/payment/payment_card_page.dart';
import 'package:finalproject_front/pages/payment/payment_detail_page.dart';
import 'package:finalproject_front/pages/payment/payment_installment_list_page.dart';
import 'package:finalproject_front/pages/payment/payment_sales_detail_pages.dart';
import 'package:finalproject_front/pages/search/search_detail_page.dart';
import 'package:finalproject_front/pages/search/search_main_page.dart';
import 'package:finalproject_front/pages/sign/join_division_page.dart';
import 'package:finalproject_front/pages/sign/login_division_page.dart';
import 'package:finalproject_front/pages/sign/login_page.dart';
import 'package:finalproject_front/pages/subscribe/subscribe_main_page.dart';
import 'package:finalproject_front/pages/user/user_coupon_page.dart';
import 'package:finalproject_front/pages/user/user_login_my_page/user_login_my_page.dart';
import 'package:finalproject_front/pages/user/user_logout_my_page.dart';
import 'package:finalproject_front/pages/user/user_profile_detail_page.dart';
import 'package:finalproject_front/pages/user/user_profile_insert_page.dart';
import 'package:finalproject_front/pages/user/user_update_page/user_update_page.dart';
import 'package:finalproject_front/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import 'domain/user_session.dart';
import 'service/local_service.dart';

void main() async {
  //자동 로그인은 나중에
  //  main메서드에서 비동기 메서드를 사용하기 위함.
  WidgetsFlutterBinding.ensureInitialized();
  await LocalService().fetchJwtToken();
  Logger().d("main에서 확인 ${UserSession.jwtToken}");
  runApp(
    ProviderScope(
      child: const MyApp(),
    ),
  );
}

final navigatorKey = GlobalKey<NavigatorState>();
Future<String?> isLogin = secureStorage.read(key: "jwtToken");

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      initialRoute: UserSession.isLogin ? Move.mainPage : Move.loginPage,
      routes: getRouters(),
      theme: theme(),
    );
  }
}
