import 'package:finalproject_front/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'join_category_period.dart';

class JoinCategorySelectButton extends StatelessWidget {
  const JoinCategorySelectButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "관심사",
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
            child: JoinCategoryPeriod(),
            width: size.width,
            height: 60,
          )
        ],
      ),
    );
  }
}
