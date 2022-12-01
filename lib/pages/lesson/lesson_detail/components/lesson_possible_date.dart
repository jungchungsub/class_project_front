import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class LessonPossibleDate extends StatelessWidget {
  const LessonPossibleDate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "가능일",
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
              child: Column(
                children: [
                  _buildDate(text: "월요일 : 18:00 ~ 23:00"),
                  _buildDate(text: "화요일 : 18:00 ~ 23:00"),
                  _buildDate(text: "수요일 : 18:00 ~ 23:00"),
                  _buildDate(text: "목요일 : 18:00 ~ 23:00"),
                  _buildDate(text: "금요일 : 18:00 ~ 23:00"),
                  _buildDate(text: "토요일 : 18:00 ~ 23:00"),
                  _buildDate(text: "일요일 : 18:00 ~ 23:00"),
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
}

class _buildDate extends StatelessWidget {
  final String text;
  const _buildDate({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "${text}",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
