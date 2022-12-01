import 'package:finalproject_front/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class FrequentlyAskedQuestions extends StatelessWidget {
  const FrequentlyAskedQuestions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
