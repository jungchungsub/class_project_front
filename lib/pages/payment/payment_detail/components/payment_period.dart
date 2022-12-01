import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class PaymentPeriod extends StatefulWidget {
  const PaymentPeriod({Key? key}) : super(key: key);

  @override
  State<PaymentPeriod> createState() => _PaymentPeriodState();
}

class _PaymentPeriodState extends State<PaymentPeriod> {
  final List<String> items = [
    '일시불',
    '2개월(무)',
    '3개월(무)',
    '4개월(무)',
    '5개월(무)',
    '6개월(무)',
    '7개월(무)',
    '8개월(무)',
    '9개월(무)',
    '10개월(무)',
    '11개월(무)',
    '12개월(무)',
  ];
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
                color: Color(0xff4880ED),
                fontWeight: FontWeight.bold),
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
