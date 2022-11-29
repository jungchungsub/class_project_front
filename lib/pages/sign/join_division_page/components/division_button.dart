import 'package:finalproject_front/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DivisionButton extends StatelessWidget {
  const DivisionButton({
    Key? key,
    required this.context,
    required this.subtitle,
    required this.title,
  }) : super(key: key);

  final BuildContext context;
  final String subtitle;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: Color(0xffF8F8F8),
      onTap: () {
        Navigator.pushNamed(context, "/join");
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${subtitle}",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: gSubTextColor,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "${title}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Icon(CupertinoIcons.forward)
        ],
      ),
    );
  }
}
