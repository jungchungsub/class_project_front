import 'package:finalproject_front/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class LessonTitle extends StatelessWidget {
  const LessonTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          Text(
            "뷰티・운동",
            style: TextStyle(
                color: gSubTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 14),
          ),
          Text(
            "내몸 상태 바로 알기 내몸에 꼭 맞는 운동",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            child: Row(
              children: [
                Container(
                  child: Row(
                    children: [
                      Icon(
                        CupertinoIcons.star_fill,
                        color: Colors.yellow,
                        size: 18,
                      ),
                      Icon(
                        CupertinoIcons.star_fill,
                        color: Colors.yellow,
                        size: 18,
                      ),
                      Icon(
                        CupertinoIcons.star_fill,
                        color: Colors.yellow,
                        size: 18,
                      ),
                      Icon(
                        CupertinoIcons.star_fill,
                        color: Colors.yellow,
                        size: 18,
                      ),
                      Icon(
                        CupertinoIcons.star_fill,
                        color: Colors.yellow,
                        size: 18,
                      ),
                    ],
                  ),
                ),
                Text(
                  "평가 16개",
                  style: TextStyle(
                      color: gSubTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
