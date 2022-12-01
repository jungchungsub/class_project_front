import 'package:finalproject_front/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class CareerList extends StatefulWidget {
  const CareerList({Key? key}) : super(key: key);

  @override
  State<CareerList> createState() => _CareerList();
}

class _CareerList extends State<CareerList> {
  final List<String> items = ['신입', '2~3년', '4~7년', '7~10년'];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          hint: Text(
            '일시불',
            style: TextStyle(
                fontSize: 14,
                color: gSubTextColor,
                fontWeight: FontWeight.normal),
          ),
          items: items
              .map(
                (item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
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
