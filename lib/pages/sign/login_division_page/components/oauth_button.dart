import 'package:flutter/material.dart';

class OauthButton extends StatelessWidget {
  const OauthButton({
    Key? key,
    required this.context,
    required this.routeName,
    required this.imagePath,
  }) : super(key: key);

  final context;
  final routeName;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
