import 'package:finalproject_front/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildName(),
                SizedBox(height: 10),
                _buildReview(),
              ],
            ),
          ),
          _buildPicture()
        ],
      ),
    );
  }

  ClipRRect _buildPicture() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(150),
      child: Image.asset(
        "assets/picture.jpg",
        width: 80,
        height: 80,
        fit: BoxFit.cover,
      ),
    );
  }

  Row _buildReview() {
    return Row(
      children: [
        Icon(CupertinoIcons.star_fill, color: Colors.yellow, size: 16),
        SizedBox(width: 10),
        Text(
          "4.5 | 25개의 평가",
          style: TextStyle(color: gSubTextColor, fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ],
    );
  }

  Text _buildName() {
    return Text(
      "아이유",
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}
