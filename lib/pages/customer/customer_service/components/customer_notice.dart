import 'dart:async';

import 'package:finalproject_front/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/src/foundation/key.dart';

class CustomerNotice extends StatelessWidget {
  const CustomerNotice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
