import 'package:finalproject_front/constants.dart';
import 'package:flutter/material.dart';

class LessonPrice extends StatelessWidget {
  final Function scrollAnimate;
  const LessonPrice(
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
              "가격",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            onTap: (() {}),
            decoration: InputDecoration(
              hintText: "ex) 50,000원",
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
