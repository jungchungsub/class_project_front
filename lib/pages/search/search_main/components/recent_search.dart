import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class RecentSearch extends StatelessWidget {
  final String text;
  const RecentSearch({required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${text}",
            style: TextStyle(fontSize: 14, color: Colors.black),
          ),
          Icon(
            CupertinoIcons.clear_thick,
          )
        ],
      ),
    );
  }
}
