import 'package:finalproject_front/constants.dart';
import 'package:flutter/material.dart';

class LessonTime extends StatelessWidget {
  final Function scrollAnimate;
  const LessonTime(
    this.scrollAnimate, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "수강시간",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            onTap: (() {}),
            decoration: InputDecoration(
              hintText: "수강시간을 입력하세요",
              hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: gSubTextColor,
              ),
              //3. 기본 textFormfield 디자인 - enabledBorder
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: gBorderColor, width: 3.0),
                borderRadius: BorderRadius.circular(15),
              ),
              //마우스 올리고 난 후 스타일
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: gBorderColor, width: 3.0),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
