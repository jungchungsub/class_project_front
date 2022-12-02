import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CategoryFilter extends StatelessWidget {
  const CategoryFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          OutlinedButton(
            onPressed: () {},
            child: Row(
              children: [
                Icon(
                  CupertinoIcons.arrow_2_circlepath,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "초기화",
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
              ],
            ),
            style: OutlinedButton.styleFrom(
                shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            )),
          ),
          _buildCategoryFilterList("예산"),
          _buildCategoryFilterList("지역"),
          _buildCategoryFilterList("등급"),
        ],
      ),
    );
  }
}

OutlinedButton _buildCategoryFilterList(String text) {
  return OutlinedButton(
    onPressed: () {},
    child: Row(
      children: [
        Text(
          "${text}",
          style: TextStyle(color: Colors.black, fontSize: 14),
        ),
      ],
    ),
    style: OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)),
    )),
  );
}
