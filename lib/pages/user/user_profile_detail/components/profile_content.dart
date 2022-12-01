import 'package:finalproject_front/constants.dart';
import 'package:flutter/material.dart';

class ProfileContent extends StatelessWidget {
  final String title;
  final String? content;
  const ProfileContent({
    required this.title,
    this.content,
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
              "${title}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 5),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "${content}",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: gSubTextColor),
            ),
          ),
        ],
      ),
    );
  }
}
