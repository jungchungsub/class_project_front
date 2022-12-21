import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomTextField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController? fieldController;
  final Function scrollAnimate;
  final String fieldTitle;
  final String? subTitle;
  final String hint;
  final int lines;

  const CustomTextField(this.scrollAnimate,
      {this.subTitle, this.fieldController, required this.fieldTitle, required this.hint, required this.lines, required this.onChanged, Key? key})
      : super(key: key);

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
                    text: "${fieldTitle}",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  if (subTitle != null)
                    TextSpan(
                      text: "${subTitle}",
                      style: TextStyle(color: gSubTextColor, fontSize: 10, fontWeight: FontWeight.bold),
                    )
                ],
              ),
            ),
          ),
          SizedBox(height: gap_m),
          TextFormField(
            onTap: (() {
              scrollAnimate;
            }),
            onChanged: onChanged,
            controller: fieldController,
            keyboardType: TextInputType.multiline,
            maxLines: lines,
            obscureText: hint == "비밀번호를 입력해주세요." ? true : false,
            decoration: InputDecoration(
              hintText: "${hint}",
              hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: gSubTextColor,
              ),
              //3. 기본 textFormfield 디자인 - enabledBorder
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: gClientColor, width: 3.0),
                borderRadius: BorderRadius.circular(15),
              ),
              //마우스 올리고 난 후 스타일
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: gClientColor, width: 3.0),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
