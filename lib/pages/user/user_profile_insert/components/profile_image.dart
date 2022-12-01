import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final String? imagePath;
  const ProfileImage({
    this.imagePath,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(150),
      child: Image.asset(
        "${imagePath}",
        width: 80,
        height: 80,
        fit: BoxFit.cover,
      ),
    );
  }
}
