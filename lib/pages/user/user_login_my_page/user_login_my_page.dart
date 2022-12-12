import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/pages/user/components/service_text.dart';
import 'package:finalproject_front/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/bottom_image_box.dart';
import '../components/profile_image.dart';

class UserLoginMyPage extends StatelessWidget {
  const UserLoginMyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildUserProfile(context, "의뢰인", "green1234", "전문가", "assets/picture.jpg", "/profileDetail"),
                  SizedBox(height: gap_l),
                  Text(
                    "나의 서비스",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: gap_m),
                  ServiceText(routePath: "/paymentInstallmentList", serviceText: "결제/취소 내역"),
                  SizedBox(height: gap_s),
                  ServiceText(routePath: "/userCoupon", serviceText: "쿠폰/프로모션"),
                  SizedBox(height: gap_s),
                  ServiceText(routePath: "/lessonClientList", serviceText: "수강중인 레슨"),
                  SizedBox(height: gap_s),
                  ServiceText(routePath: "/customerService", serviceText: "고객센터"),
                  SizedBox(height: gap_s),
                  ServiceText(routePath: "/lessonInsert", serviceText: "레슨 등록 전문가 "),
                  SizedBox(height: gap_s),
                  ServiceText(routePath: "/paymentSalesDetail", serviceText: "판매내역 전문가"),
                  SizedBox(height: gap_s),
                  ServiceText(routePath: "/lessonExpertList", serviceText: "등록한레슨 전문가"),
                  SizedBox(height: gap_xxl),
                  BottomImageBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 1.0,
      leading: IconButton(
        onPressed: () {},
        icon: Icon(
          CupertinoIcons.bell,
          color: Colors.black,
          size: 26,
        ),
      ),
      centerTitle: true,
      title: TextButton(
        onPressed: () {},
        child: Text(
          "로고",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 15, right: 20),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, "/userUpdate");
            },
            child: Text(
              "계정 설정",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Widget _buildUserProfile(BuildContext context, String userState, String userId, String changeState, String profileImagePath, String routePath) {
  return Row(
    children: [
      ProfileImage(profileImagePath: profileImagePath, routePath: routePath),
      SizedBox(width: 20),
      Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 15,
              decoration: BoxDecoration(
                color: gClientColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: Text(
                  "${userState}",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "${userId}",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: gBorderColor),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 5.0),
                  child: Row(
                    children: [
                      Icon(
                        CupertinoIcons.person_2,
                        size: 18,
                        color: gPrimaryColor,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "${changeState}로 전환",
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      )
    ],
  );
}

Widget _buildShoppingList(BuildContext context, String shoppingListTitle, String routePath, String shoppingListsubTitle, String hintText) {
  return Container(
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${shoppingListTitle}",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            InkWell(
              onTap: () {
                //전체보기 페이지로 이동
                Navigator.pushNamed(context, "${routePath}");
              },
              child: Text(
                "${shoppingListsubTitle}",
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal),
              ),
            ),
          ],
        ),
        SizedBox(height: gap_m),
        Container(
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
            color: gContentBoxColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Text(
              "${hintText}",
              style: TextStyle(color: gSubTextColor, fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    ),
  );
}
