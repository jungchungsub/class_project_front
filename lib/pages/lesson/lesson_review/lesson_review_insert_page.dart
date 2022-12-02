import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/pages/lesson/lesson_review/components/review_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'components/lesson_card.dart';
import 'components/review_insert_button.dart';
import 'components/review_rating_bar.dart';

class LessonReviewInsertPage extends StatefulWidget {
  const LessonReviewInsertPage({super.key});

  @override
  State<LessonReviewInsertPage> createState() => _LessonReviewInsertPageState();
}

class _LessonReviewInsertPageState extends State<LessonReviewInsertPage> {
  late ScrollController
      scrollController; // ScrollerController은 non-null이다, late를 선언해 나중에 초기화.

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
              LessonCard(
                  lessongImage: "assets/background1.gif",
                  lessonTitle: "깔끔하고 감각적인 최고의 홈페이지를 제작해드립니다.",
                  expertName: "유리아",
                  lessonPrice: "50000원",
                  lessongEndDate: "2022.12.08"),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "수업은 만족하셨나요?",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              ReviewRatingBar(),
              SizedBox(height: 20),
              ReviewContent(scrollAnimate),
              SizedBox(height: 20),
              ReviewInsertButton()
            ],
          ),
        ),
      ),
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
      scrollController.animateTo(MediaQuery.of(context).viewInsets.bottom,
          duration: Duration(microseconds: 100), curve: Curves.easeIn);
    });
  }
}
