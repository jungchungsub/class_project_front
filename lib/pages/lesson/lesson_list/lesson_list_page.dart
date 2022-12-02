import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/pages/lesson/lesson_list/components/lesson_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class LessonListPage extends StatelessWidget {
  const LessonListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: ListView(
        children: [
          LessonList(
              image: "https://picsum.photos/201", routePath: "/reviewInsert"),
          LessonList(
              image: "https://picsum.photos/202", routePath: "/reviewInsert"),
          LessonList(
              image: "https://picsum.photos/203", routePath: "/reviewInsert"),
          LessonList(
              image: "https://picsum.photos/204", routePath: "/reviewInsert"),
          LessonList(
              image: "https://picsum.photos/205", routePath: "/reviewInsert"),
          LessonList(
              image: "https://picsum.photos/206", routePath: "/reviewInsert"),
          LessonList(
              image: "https://picsum.photos/207", routePath: "/reviewInsert"),
        ],
      ),
    );
  }

  AppBar _buildAppbar(context) {
    return AppBar(
      elevation: 1.0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          CupertinoIcons.back,
          color: Colors.black,
          size: 26,
        ),
      ),
      centerTitle: true,
      title: TextButton(
        onPressed: () {},
        child: Text(
          "구매한 클래스",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
