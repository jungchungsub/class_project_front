import 'package:finalproject_front/constants.dart';
import 'package:flutter/material.dart';

class BeforeLoginButton extends StatelessWidget {
  const BeforeLoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/main");
      },
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            "로그인 전 둘러보기",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: gSubTextColor,
            ),
          ),
        ),
      ),
    );
  }
}
