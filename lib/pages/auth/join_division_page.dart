import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class JoinDivisionPage extends StatelessWidget {
  const JoinDivisionPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(gap_l),
          child: Column(
            children: [
              SizedBox(height: 50),
              SizedBox(
                  width: size.width, child: _buildHeaderIntro(context, "어떤 서비스를 이용하고 싶으신가요?", "원하는 회원가입 유형을 선택하세요.\n의뢰인으로 가입 후에도 전문가 등록이 가능합니다.")),
              SizedBox(height: 400),
              _buildDivisionButton(context, "비즈니스 외주,아웃소싱을 원한다면", "의뢰인으로 가입", "/join"),
              SizedBox(height: gap_l),
              _buildDivisionButton(context, "전문성으로 수익창출을 원한다면", "전문가로 가입", "/join"),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildDivisionButton(BuildContext context, String divisionTitle, String divisionSubTitle, String routePath) {
  return InkWell(
    onTap: () {
      Navigator.pushNamed(context, routePath);
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
