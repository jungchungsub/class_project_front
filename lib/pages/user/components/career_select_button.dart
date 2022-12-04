import 'package:finalproject_front/constants.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:finalproject_front/pages/user/components/career_period.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProfileCareerSeleteButton extends StatelessWidget {
  const ProfileCareerSeleteButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "총 경력 기간을 선택해 주세요.",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: gBorderColor, width: 3),
              borderRadius: BorderRadius.circular(10),
            ),
            child: CareerPeriod(),
            width: size.width,
            height: 60,
          )
        ],
      ),
    );
  }
}
