import 'package:finalproject_front/pages/main/home/home_page.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final Color? textColor;
  final Color? backgroundColor;
  final Color? iconColor;
  const LoginButton(
      {this.backgroundColor,
      this.iconColor,
      this.textColor,
      required this.text,
      this.icon,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: backgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(icon, color: iconColor),
            Text(
              "${text}",
              style: TextStyle(color: textColor, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
