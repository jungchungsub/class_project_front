import 'package:finalproject_front/pages/like/like_main/components/like_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LikeMainPage extends StatefulWidget {
  const LikeMainPage({Key? key}) : super(key: key);

  @override
  State<LikeMainPage> createState() => _LikeMainPageState();
}

class _LikeMainPageState extends State<LikeMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        title: Text(
          "찜목록",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 15, right: 20),
            child: Text(
              "필터",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          LikeList(path: "/lessonDetail", image: "https://picsum.photos/201"),
          LikeList(path: "/lessonDetail", image: "https://picsum.photos/202"),
          LikeList(path: "/lessonDetail", image: "https://picsum.photos/203"),
          LikeList(path: "/lessonDetail", image: "https://picsum.photos/204"),
          LikeList(path: "/lessonDetail", image: "https://picsum.photos/205"),
          LikeList(path: "/lessonDetail", image: "https://picsum.photos/206")
        ],
      ),
    );
  }
}
