import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final String profileImagePath;
  final String routePath;
  const ProfileImage({
    required this.profileImagePath,
    required this.routePath,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "${routePath}");
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(150),
        child: Image.asset(
          "${profileImagePath}",
          width: 80,
          height: 80,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
