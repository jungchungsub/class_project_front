import 'package:finalproject_front/pages/user/user_detail/components/buy_list.dart';
import 'package:finalproject_front/pages/user/user_detail/components/image_box.dart';
import 'package:finalproject_front/pages/user/user_detail/components/my_service.dart';
import 'package:finalproject_front/pages/user/user_detail/components/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class UserLoginMyPage extends StatelessWidget {
  const UserLoginMyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildappBar(context),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Profile(),
            SizedBox(height: 20),
            BuyList(path: "/lessonList"),
            SizedBox(height: 20),
            MyService(),
            SizedBox(height: 80),
            ImageBox(),
          ],
        ),
      ),
    );
  }

  AppBar _buildappBar(BuildContext context) {
    return AppBar(
      elevation: 1.0,
      leading: IconButton(
        onPressed: () {},
        icon: Icon(
          CupertinoIcons.bell,
          color: Colors.black,
          size: 26,
        ),
      ),
      centerTitle: true,
      title: TextButton(
        onPressed: () {},
        child: Text(
          "로고",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 15, right: 20),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, "/userUpdate");
            },
            child: Text(
              "계정 설정",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
