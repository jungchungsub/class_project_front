import 'package:finalproject_front/pages/category/category_detail_page.dart';
import 'package:finalproject_front/pages/chat/chat_list_page.dart';
import 'package:finalproject_front/pages/customer/customer_service_page.dart';
import 'package:finalproject_front/pages/lesson/lesson_client_page.dart';
import 'package:finalproject_front/pages/lesson/lesson_detail_page/lesson_detail_page.dart';
import 'package:finalproject_front/pages/lesson/lesson_insert_page.dart';
import 'package:finalproject_front/pages/lesson/lesson_master_list.dart';
import 'package:finalproject_front/pages/lesson/lesson_review_insert_page.dart';
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
import 'package:finalproject_front/pages/user/user_profile_detail_page.dart';
import 'package:finalproject_front/pages/user/user_profile_insert_page.dart';
import 'package:finalproject_front/pages/user/user_update_page/user_update_page.dart';
import 'package:flutter/cupertino.dart';

class Move {
  static String mainPage = "/mainPage";
  static String loginDivisionPage = "/loginDivisionPage";
  static String loginPage = "/loginPgae";
  static String joinPage = "/joinPage";
  static String homePage = "/homePage";
  static String joginDivisionPage = "/joginDivisionPage";
  static String paymentDetailPage = "/paymentDetailPage";
  static String paymentCardPage = "/paymentCardPage";
  static String orderDetailPage = "/orderDetailPage";
  static String lessonDetailPage = "/lessonDetailPage";
  static String categoryDetailPage = "/categoryDetailPage";
  static String loginMyPage = "/loginMyPage";
  static String logoutMyPage = "/logoutMyPage";
  static String profileDetailPage = "/profileDetailPage";
  static String lessonClientListPage = "/lessonClientListPage";
  static String lessonMasterListPage = "/lessonExpertListPage";
  static String searchPage = "/searchPage";
  static String customerServicePage = "/customerServicePage";
  static String userCouponPage = "/userCouponPage";
  static String profileInsertPage = "/profileInsertPage";
  static String paymentSalesDetailPage = "/paymentSalesDetailPage";
  static String paymentInstallmentListPage = "/paymentInstallmentListPage";
  static String chatListPage = "/chatListPage";
  static String subscribePage = "/subscribePage";
  static String userUpdatePage = "/userUpdatePage";
  static String reviewInsertPage = "/reviewInsertPage";
  static String searchDetailPage = "/searchDetailPage";
  static String lessonInsertPage = "/lessonInsertPage";
}

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
Map<String, Widget Function(BuildContext)> getRouters() {
  return {
    //Route.joinPage: (context) => JoinPage(role: ''),

    Move.mainPage: (context) => MainPage(),
    Move.loginDivisionPage: (context) => LoginDivisionPage(),
    Move.joginDivisionPage: (context) => JoinDivisionPage(),
    Move.loginPage: (context) => LoginPage(),
    Move.homePage: (context) => HomePage(),
    Move.paymentDetailPage: (context) => PaymentDetailPage(),
    Move.paymentCardPage: (context) => PaymentCardPage(),
    Move.orderDetailPage: (context) => OrderDetailPage(),
    Move.lessonDetailPage: (context) => LessonDetailPage(lessonId: 1), // 테스트 데이터1 ->나중에 지우기
    Move.categoryDetailPage: (context) => CategoryDetailPage(),
    Move.loginMyPage: (context) => UserLoginMyPage(),
    Move.logoutMyPage: (context) => UserLoginMyPage(),
    Move.profileDetailPage: (context) => UserProfileDetailPage(),
    Move.lessonClientListPage: (context) => LessonClientListPage(),
    Move.lessonMasterListPage: (context) => LessonMasterListPage(),
    Move.searchPage: (context) => SearchPage(),
    Move.customerServicePage: (context) => CustomerServicePage(),
    Move.userCouponPage: (context) => UserCouponPage(),
    Move.profileInsertPage: (context) => UserProfileInsertPage(),
    Move.paymentSalesDetailPage: (context) => PaymentSalesDetailPage(),
    Move.paymentInstallmentListPage: (context) => PaymentInstallmentListPage(),
    Move.chatListPage: (context) => ChatListPage(),
    Move.subscribePage: (context) => SubscribePage(),
    Move.userUpdatePage: (context) => UserUpdatePage(),
    Move.reviewInsertPage: (context) => LessonReviewInsertPage(),
    Move.searchDetailPage: (context) => SearchDetailPage(),
    Move.lessonInsertPage: (context) => LessonInsertPage(),
    //"/lessonDetail": (context) => LessonDetailPage(lessonId: 1),
  };
}// 라우팅 주소의 가장 앞에는 동사,명사
