import 'package:flutter/material.dart';

class OtherButton extends StatelessWidget {
  const OtherButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/login");
      },
      child: Container(
        width: double.infinity,
        height: 50,
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            "다른 방법으로 시작",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
