import 'package:finalproject_front/constants.dart';
import 'package:flutter/material.dart';

class ProfileEducation extends StatelessWidget {
  final Function scrollAnimate;
  const ProfileEducation(
    this.scrollAnimate, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "학력 전공을 작성해 주세요.",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: "선택사항",
                    style: TextStyle(
                        color: gSubTextColor,
                        fontSize: 10,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            onTap: (() {
              scrollAnimate;
            }),
            decoration: InputDecoration(
              hintText: "예) 사이버 보안 전공",
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
      ),
    );
  }
}
