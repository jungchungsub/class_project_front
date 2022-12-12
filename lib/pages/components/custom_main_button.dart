import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class CustomMainButton extends StatelessWidget {
  final UserController? uc;
  final Function? action;
  final String buttonText;
  final String buttonRoutePath;

  const CustomMainButton({
    this.uc,
    this.action,
    required this.buttonRoutePath,
    required this.buttonText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        action;
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: gButtonOffColor,
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            "${buttonText}",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
