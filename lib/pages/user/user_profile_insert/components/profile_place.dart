import 'package:finalproject_front/constants.dart';
import 'package:flutter/material.dart';

class ProfilePlace extends StatelessWidget {
  const ProfilePlace({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "지역을 작성해주세요.",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(
              hintText: "예) 부산, 서울, 경기도",
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
