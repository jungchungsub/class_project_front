import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DivisionButton extends StatelessWidget {
  final String title;
  final String subtitle;
  const DivisionButton({
    required this.title,
    required this.subtitle,
    Key? key,
  }) : super(key: key);

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
                  color: Color(0xff6C6C6C),
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
