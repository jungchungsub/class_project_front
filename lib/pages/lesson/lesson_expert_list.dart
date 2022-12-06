import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/size.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LessonExpertListPage extends StatelessWidget {
  const LessonExpertListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: ListView(
        children: [
          _buildLessonList(
              context, "https://picsum.photos/201", "/lessonUpdate"),
          _buildLessonList(
              context, "https://picsum.photos/202", "/lessonUpdate"),
          _buildLessonList(
              context, "https://picsum.photos/203", "/lessonUpdate"),
          _buildLessonList(
              context, "https://picsum.photos/204", "/lessonUpdate"),
          _buildLessonList(
              context, "https://picsum.photos/205", "/lessonUpdate"),
          _buildLessonList(
              context, "https://picsum.photos/206", "/lessonUpdate"),
          _buildLessonList(
              context, "https://picsum.photos/207", "/lessonUpdate")
        ],
      ),
    );
  }

  Container _buildLessonList(
      BuildContext context, String imagePath, String routePath) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xffF0F0F0), width: 3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: 90,
                            width: 110,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage("${imagePath}"),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: gap_m,
                        ),
                        Container(
                          width: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "깔끔하고 감각적인 최고의 홈페이지를 제작해드립니다.",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                "전문가 : 유리아",
                                style: TextStyle(fontSize: 12),
                              ),
                              Text(
                                "50000원",
                                style: TextStyle(fontSize: 12),
                              ),
                              Text(
                                "마감일자 : 2022.12.07",
                                style: TextStyle(fontSize: 12),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    InkWell(
                      onTap: (() {
                        Navigator.pushNamed(context, "${routePath}");
                      }),
                      child: Container(
                        width: double.infinity,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: gContentBoxColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: (() {
                              Navigator.pushNamed(context, "${routePath}");
                            }),
                            child: Text(
                              "수정하기",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: gButtonOffColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
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
          "클래스 리스트",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
