import 'package:finalproject_front/pages/lesson/lesson_update/components/lesson_bottom_button.dart';
import 'package:finalproject_front/pages/lesson/lesson_update/components/lesson_price.dart';
import 'package:finalproject_front/pages/lesson/lesson_update/components/lesson_category.dart';
import 'package:finalproject_front/pages/lesson/lesson_update/components/lesson_count.dart';
import 'package:finalproject_front/pages/lesson/lesson_update/components/lesson_curriculum.dart';
import 'package:finalproject_front/pages/lesson/lesson_update/components/lesson_deadline.dart';
import 'package:finalproject_front/pages/lesson/lesson_update/components/lesson_image.dart';
import 'package:finalproject_front/pages/lesson/lesson_update/components/lesson_place.dart';
import 'package:finalproject_front/pages/lesson/lesson_update/components/lesson_time.dart';
import 'package:finalproject_front/pages/lesson/lesson_update/components/lesson_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class LessonUpdatePage extends StatefulWidget {
  const LessonUpdatePage({Key? key}) : super(key: key);

  @override
  State<LessonUpdatePage> createState() => _LessonUpdatePageState();
}

class _LessonUpdatePageState extends State<LessonUpdatePage> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = new ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                LessonImage(),
                LessonTitle(scrollAnimate),
                LessonCurriculum(scrollAnimate),
                LessonTime(scrollAnimate),
                LessonCount(scrollAnimate),
                LessonPlace(scrollAnimate),
                LessonCategory(),
                LessonPrice(scrollAnimate),
                LessonDeadLine(date: ''),
                LessonBottomButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppbar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1.0,
      leading: IconButton(
          icon: Icon(
            CupertinoIcons.back,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          }),
      title: Text(
        "클래스 수정하기",
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
    );
  }

  void scrollAnimate() {
    Future.delayed(Duration(milliseconds: 600), () {
      //0.6초 이후 키보드 올라옴
      // ViewInsets은 현재 페이지에서 내가 컨트롤 할 수 없는 영역을 뜻함,
      // bottom은 키보드가 아래에서 올라오기 때문
      scrollController.animateTo(MediaQuery.of(context).viewInsets.bottom,
          duration: Duration(microseconds: 100), // 0.1초 이후 field가 올라간다.
          curve: Curves.easeIn); //Curves - 올라갈때 애니메이션
    });
  }
}
