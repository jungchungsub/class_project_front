import 'package:finalproject_front/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildProfileImage(context, "/profileDetail"),
        SizedBox(width: 20),
        _buildProfileText(),
      ],
    );
  }

  Container _buildProfileText() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 15,
            decoration: BoxDecoration(
              color: gClientColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              "의뢰인",
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "green123456",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          InkWell(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: gBorderColor),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 3.0, horizontal: 5.0),
                child: Row(
                  children: [
                    Icon(
                      CupertinoIcons.person_2,
                      size: 18,
                      color: gPrimaryColor,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "전문가로 전환",
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  InkWell _buildProfileImage(context, String routePath) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "${routePath}");
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(150),
        child: Image.asset(
          "assets/picture.jpg",
          width: 80,
          height: 80,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
