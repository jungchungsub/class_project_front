import 'package:finalproject_front/constants.dart';
import 'package:flutter/material.dart';

class ProfileDetail extends StatelessWidget {
  const ProfileDetail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildIntro("자기소개 작성하는 공간 충섭아 컨벤션이 너무 어려워 나 좀 살려줘 머리가 터질거같애 할수있어할수있어할수있어할수있어할수있어할수있어할수있어할수있어할수있어할수있어할수있어할수있어할수있어할수있어할수있어할수있어할수있어할수있어할수있어"),
          SizedBox(height: 10),
          _buildDetail("지역", "부산"),
          SizedBox(height: 10),
          _buildDetail("학력전공", "컴퓨터공학과"),
          SizedBox(height: 10),
          _buildDetail("보유자격증", "개인정보취급사"),
          SizedBox(height: 10),
          _buildDetail("총 경력기간", "신입"),
          SizedBox(height: 10),
          _buildDetail("경력사항", "0~1년"),
        ],
      ),
    );
  }

  Container _buildIntro(String introContent) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "소개",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(1),
            ),
            width: 30,
            height: 3,
          ),
          SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(),
            child: Text(
              "${introContent}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: gSubTextColor),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Container _buildDetail(String detailTitle, String detailContent) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${detailTitle}",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            "${detailContent}",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: gSubTextColor),
          ),
        ],
      ),
    );
  }
}
