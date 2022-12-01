import 'package:finalproject_front/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class LessonEvaluation extends StatelessWidget {
  const LessonEvaluation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "받은평가",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xffEAF2FD),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Row(
                children: [
                  Text(
                    "4.7",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          _buildStar(CupertinoIcons.star_fill),
                          SizedBox(width: 5),
                          _buildStar(CupertinoIcons.star_fill),
                          SizedBox(width: 5),
                          _buildStar(CupertinoIcons.star_fill),
                          SizedBox(width: 5),
                          _buildStar(CupertinoIcons.star_fill),
                          SizedBox(width: 5),
                          _buildStar(CupertinoIcons.star_fill),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "124개의 평가",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: gSubTextColor),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  Icon _buildStar(IconData mIcon) {
    return Icon(
      mIcon,
      color: Colors.yellow,
      size: 14,
    );
  }
}
