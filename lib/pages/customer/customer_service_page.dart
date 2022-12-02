import 'package:finalproject_front/constants.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomerServicePage extends StatelessWidget {
  const CustomerServicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                _buildImageBox(),
                _buildCustomerNotice(),
                _buildFrequentlyAskedQuestion(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container _buildFrequentlyAskedQuestion() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          Text(
            "FAQ",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          _buildFaqList("[서비스 소개] 이걸 완료할 수 있을까요?"),
          _buildFaqList("[이용 방법] 전문가에게 어떻게 문의하나요?"),
          _buildFaqList("[문제 해결] 거래 중 분쟁이 발생하면 어떡하나요?"),
          _buildFaqList("[이용 방법] 쿠폰은 어떻게 사용하나요?"),
        ],
      ),
    );
  }

  Column _buildFaqList(String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: Text(
            "${text}",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Divider(
          thickness: 1,
          color: gBorderColor,
        )
      ],
    );
  }

  Container _buildCustomerNotice() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "공지사항",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          _buildNotice("11월 고객센터 운영시간 안내"),
          _buildNotice("사칭하는 메시지, 조심하세요!"),
          _buildNotice("패널티 정책 안내(시행일: 7월 4일)"),
          _buildNotice("개인정보처리방침 계정 안내(시행일: 1월 7일)"),
        ],
      ),
    );
  }

  Column _buildNotice(String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: Text(
            "${text}",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Divider(
          thickness: 1,
          color: gBorderColor,
        )
      ],
    );
  }

  Padding _buildImageBox() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 30),
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: NetworkImage("https://picsum.photos/200"),
              fit: BoxFit.cover),
        ),
      ),
    );
  }

  AppBar _buildAppbar(BuildContext context) {
    return AppBar(
      elevation: 1.0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          CupertinoIcons.back,
          color: Colors.black,
          size: 26,
        ),
      ),
      centerTitle: true,
      title: TextButton(
        onPressed: () {},
        child: Text(
          "크몽 고객센터",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
