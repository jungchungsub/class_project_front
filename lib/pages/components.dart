import 'package:finalproject_front/constants.dart';
import 'package:flutter/material.dart';

class ArachachaButton extends StatelessWidget {
  final String buttonText;
  final String buttonRoutePath;
  const ArachachaButton({
    required this.buttonRoutePath,
    required this.buttonText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/profileInsert");
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: gButtonOffColor,
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            "프로필 등록/수정하기",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
