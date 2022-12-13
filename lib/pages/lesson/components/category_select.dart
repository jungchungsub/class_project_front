import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/pages/lesson/components/category_period.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CategorySelecter extends StatelessWidget {
  const CategorySelecter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                "카테고리 선택",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: gBorderColor, width: 3),
              borderRadius: BorderRadius.circular(15),
            ),
            child: CategoryPeriod(),
            width: 400,
            height: 60,
          )
        ],
      ),
    );
  }
}
