import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class ServiceTextButton extends StatelessWidget {
  const ServiceTextButton({
    Key? key,
    required this.context,
    required this.text,
    this.routePath,
    this.action,
  }) : super(key: key);

  final BuildContext context;
  final String text;
  final String? routePath;
  final action;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      child: Container(
        width: double.infinity,
        child: TextButton(
          onPressed: () {
            Logger().d("계정 설정 페이지 실행됌?");
            action;
          },
          child: Text(
            "${text}",
            style: TextStyle(color: Color.fromARGB(255, 159, 150, 150)),
          ),
          style: TextButton.styleFrom(alignment: Alignment.bottomLeft),
        ),
      ),
    );
  }
}
