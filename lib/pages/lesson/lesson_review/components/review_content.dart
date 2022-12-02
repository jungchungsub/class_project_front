import 'package:finalproject_front/constants.dart';
import 'package:flutter/material.dart';

class ReviewContent extends StatelessWidget {
  final Function scrollAnimate;
  const ReviewContent(
    this.scrollAnimate, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "리뷰 작성",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 10),
        TextFormField(
          onTap: (() {
            scrollAnimate;
          }),
          maxLines: 6,
          decoration: InputDecoration(
            hintText: "악플은 안대요 ><",
            hintStyle: TextStyle(
              fontSize: 14,
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
    );
  }
}
