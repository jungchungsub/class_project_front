import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:finalproject_front/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class JoinCategoryPeriod extends StatefulWidget {
  const JoinCategoryPeriod({Key? key}) : super(key: key);

  @override
  State<JoinCategoryPeriod> createState() => _JoinCategoryPeriod();
}

class _JoinCategoryPeriod extends State<JoinCategoryPeriod> {
  final List<String> items = ['뷰티', '운동', '댄스', '뮤직', '미술', '문학', '공예', '기타'];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          hint: Text(
            '관심 종목을 선택해주세요.',
            style: TextStyle(fontSize: 16, color: gSubTextColor, fontWeight: FontWeight.normal),
          ),
          items: items
              .map(
                (item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              )
              .toList(),
          value: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value as String;
            });
          },
        ),
      ),
    );
  }
}
