import 'package:finalproject_front/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class CategoryPeriod extends StatefulWidget {
  const CategoryPeriod({Key? key}) : super(key: key);

  @override
  State<CategoryPeriod> createState() => _CategoryPeriodState();
}

class _CategoryPeriodState extends State<CategoryPeriod> {
  final List<String> items = [
    '뷰티',
    '운동',
    '댄스',
    '뮤직',
    '미술',
    '문학',
    '공예',
    '기타',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          hint: Text(
            '카테고리를 선택해주세요',
            style: TextStyle(
              fontSize: 16,
              color: gSubTextColor,
            ),
          ),
          items: items
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        item,
                        style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ))
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
