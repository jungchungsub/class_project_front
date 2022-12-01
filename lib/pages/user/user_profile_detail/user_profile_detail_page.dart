import 'dart:ffi';

import 'package:finalproject_front/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class UserProfileDetailPage extends StatelessWidget {
  const UserProfileDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(),
            Container(
              color: Colors.grey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("소개"),
                        SizedBox(height: 5),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(1),
                          ),
                          width: 30,
                          height: 3,
                        ),
                        SizedBox(height: 5),
                        Container(
                          decoration: BoxDecoration(),
                          child: Text(
                            "자기소개 작성하는 공간 충섭아 컨벤션이 너무 어려워 나 좀 살려줘 머리가 터질거같애 할수있어할수있어할수있어할수있어할수있어할수있어할수있어할수있어할수있어할수있어할수있어할수있어할수있어할수있어할수있어할수있어할수있어할수있어할수있어",
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text("지역"),
                        Text("부산"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppbar(BuildContext context) {
    return AppBar(
      elevation: 1,
      centerTitle: true,
      title: Text(
        "프로필",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      leading: IconButton(
          icon: Icon(
            CupertinoIcons.back,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          }),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "이름 작성하는 부분",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Icon(CupertinoIcons.star_fill,
                        color: Colors.yellow, size: 15),
                    SizedBox(width: 10),
                    Text(
                      "4.5 | 25개의 평가",
                      style: TextStyle(
                          color: gSubTextColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                  ],
                )
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(150),
            child: Image.asset(
              "assets/picture.jpg",
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
