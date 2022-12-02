import 'package:finalproject_front/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ServiceText extends StatelessWidget {
  final String routePath;
  final String serviceText;
  const ServiceText({
    required this.routePath,
    required this.serviceText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "${routePath}");
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${serviceText}",
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: gSubTextColor),
          ),
          Icon(
            CupertinoIcons.right_chevron,
            size: 14,
            color: gSubTextColor,
          )
        ],
      ),
    );
  }
}
