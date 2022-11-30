import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    required this.context,
    required this.text,
    required this.path,
  }) : super(key: key);

  final BuildContext context;
  final String text;
  final String path;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Container(
        width: double.infinity,
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, path);
          },
          child: Text(
            "${text}",
            style: TextStyle(color: Colors.black),
          ),
          style: TextButton.styleFrom(alignment: Alignment.bottomLeft),
        ),
      ),
    );
  }
}
