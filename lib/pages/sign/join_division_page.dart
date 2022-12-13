import 'package:extended_image/extended_image.dart';
import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/controller/user_controller.dart';
import 'package:finalproject_front/dto/request/auth_req_dto.dart';
import 'package:finalproject_front/pages/sign/join_page.dart';
import 'package:finalproject_front/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class JoinDivisionPage extends ConsumerWidget {
  const JoinDivisionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rc = ref.read(userController);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(gap_l),
          child: Column(
            children: [
              SizedBox(height: 50),
              SizedBox(
                width: size.width,
                child: _buildHeaderIntro(context, "어떤 서비스를 이용하고 싶으신가요?", "원하는 회원가입 유형을 선택하세요.\n의뢰인으로 가입 후에도 전문가 등록이 가능합니다."),
              ),
              SizedBox(height: 400),
              _buildDivisionButton(context, "비즈니스 외주,아웃소싱을 원한다면", "의뢰인으로 가입", "/join", "USER", rc),
              SizedBox(height: gap_l),
              _buildDivisionButton(context, "전문성으로 수익창출을 원한다면", "전문가로 가입", "/join", "MASTER", rc),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildDivisionButton(BuildContext context, String divisionTitle, String divisionSubTitle, String routePath, String role, UserController rc) {
  return InkWell(
    onTap: () {
      rc.moveJoinPage(role);
      Logger().d("여긴 실행되나? 버튼클릭");
      //Navigator.pushNamed(context, routePath, arguments: JoinPage(role: "USER"));
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${divisionSubTitle}",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: gSubTextColor,
              ),
            ),
            SizedBox(height: gap_m),
            Text(
              "${divisionTitle}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Icon(CupertinoIcons.forward)
      ],
    ),
  );
}

Widget _buildHeaderIntro(BuildContext context, String introTitle, String introSubtitle) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("${introTitle}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      SizedBox(height: 10),
      Text(
        "${introSubtitle}",
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: gSubTextColor,
        ),
      ),
    ],
  );
}
