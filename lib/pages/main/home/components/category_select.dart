import 'package:flutter/material.dart';

class CategorySelect extends StatelessWidget {
  final String path;
  final String text;

  const CategorySelect({
    required this.path,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Color(0xffF9F9F9),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    "${path}",
                    fit: BoxFit.cover,
                    height: 40,
                    width: 40,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Text("${text}")
      ],
    );
  }
}
