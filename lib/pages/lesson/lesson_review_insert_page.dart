import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/pages/lesson/components/content_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class LessonReviewInsertPage extends StatefulWidget {
  const LessonReviewInsertPage({super.key});

  @override
  State<LessonReviewInsertPage> createState() => _LessonReviewInsertPageState();
}

class _LessonReviewInsertPageState extends State<LessonReviewInsertPage> {
  late ScrollController scrollController; // ScrollerController은 non-null이다, late를 선언해 나중에 초기화.

  @override
  void initState() {
    super.initState();
    scrollController = new ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              _buildLessonCard(
                "assets/background1.gif",
                "깔끔하고 감각적인 최고의 홈페이지를 제작해드립니다.",
                "유리아",
                "50000원",
                "2022.12.08",
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "수업은 만족하셨나요?",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              _buildReviewRatingBar(),
              SizedBox(height: 20),
              ContentBox(scrollAnimate, text: "리뷰작성", content: "악플은 안대요><", lines: 6),
              SizedBox(height: 20),
              _buildReviewInsertButton(context),
            ],
          ),
        ),
      ),
    );
  }

  InkWell _buildReviewInsertButton(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/loginMyPage");
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: gButtonOffColor,
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            "저장하고 완료",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  RatingBar _buildReviewRatingBar() {
    return RatingBar.builder(
      initialRating: 3,
      minRating: 0,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        // save 동작 필요함
      },
    );
  }

  AppBar _buildAppbar(BuildContext context) {
    return AppBar(
      elevation: 1,
      centerTitle: true,
      title: Text(
        "리뷰 작성",
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

  void scrollAnimate() {
    Future.delayed(Duration(milliseconds: 600), () {
      scrollController.animateTo(MediaQuery.of(context).viewInsets.bottom, duration: Duration(microseconds: 100), curve: Curves.easeIn);
    });
  }

  Container _buildLessonCard(String lessongImage, String lessonTitle, String expertName, String lessonPrice, String lessongEndDate) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 15),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: gBorderColor, width: 3),
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
                            image: DecorationImage(image: AssetImage("${lessongImage}"), fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${lessonTitle}",
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "전문가 : ${expertName}",
                              style: TextStyle(fontSize: 12),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "${lessonPrice}",
                              style: TextStyle(fontSize: 12),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "마감일자 :${lessongEndDate}",
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
