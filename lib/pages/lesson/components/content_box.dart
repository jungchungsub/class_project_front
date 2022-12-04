import 'dart:ffi';

import 'package:finalproject_front/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ContentBox extends StatelessWidget {
  final Function scrollAnimate;
  final String text;
<<<<<<< HEAD
  final String hintText;
  final int lines;

  const ContentBox(this.scrollAnimate, {required this.text, required this.hintText, required this.lines, Key? key}) : super(key: key);
=======
  final String content;
  final int lines;

  const ContentBox(this.scrollAnimate, {required this.text, required this.content, required this.lines, Key? key}) : super(key: key);
>>>>>>> 79519373546531f6939f60e209d66def64fb390a

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
              "${text}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            onTap: (() {
              scrollAnimate;
            }),
            keyboardType: TextInputType.multiline,
            maxLines: lines,
            decoration: InputDecoration(
<<<<<<< HEAD
              hintText: "${hintText}",
=======
              hintText: "${content}",
>>>>>>> 79519373546531f6939f60e209d66def64fb390a
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
