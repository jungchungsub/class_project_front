import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/pages/components/custom_main_button.dart';
import 'package:finalproject_front/pages/components/custom_text_field.dart';
import 'package:finalproject_front/pages/lesson/components/category_select.dart';
import 'package:finalproject_front/pages/lesson/components/lesson_deadline.dart';
import 'package:finalproject_front/pages/lesson/components/lesson_image.dart';
import 'package:finalproject_front/pages/main/home/components/category_select.dart';
import 'package:finalproject_front/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class LessonInsertPage extends StatefulWidget {
  const LessonInsertPage({Key? key}) : super(key: key);

  @override
  State<LessonInsertPage> createState() => _LessonInsertPageState();
}

class _LessonInsertPageState extends State<LessonInsertPage> {
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
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                LessonImage(),
                CustomTextField(scrollAnimate,
                    fieldTitle: "서비스제목", hint: "서비스 제목자리입니다", lines: 1),
                SizedBox(height: gap_l),
                CustomTextField(scrollAnimate,
                    fieldTitle: "커리큘럼", hint: "상세설명", lines: 6),
                SizedBox(height: gap_l),
                CustomTextField(scrollAnimate,
                    fieldTitle: "수강횟수", hint: "수강 횟수를 입력하세요", lines: 1),
                SizedBox(height: gap_l),
                CustomTextField(scrollAnimate,
                    fieldTitle: "수강시간", hint: "수강 시간을 입력하세요", lines: 1),
                SizedBox(height: gap_l),
                CustomTextField(scrollAnimate,
                    fieldTitle: "수강장소", hint: "ex) 부산시 진구 그린아카데미", lines: 1),
                CategorySelecter(),
                SizedBox(height: gap_l),
                LessonDeadLine(),
                SizedBox(height: gap_l),
                CustomMainButton(
                    buttonRoutePath: "/loginMyPage", buttonText: "프로필 등록"),
                SizedBox(height: gap_l),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _buildShowDatePickerPop() {
    Future<DateTime?> selectedDate = showDatePicker(
      context: context,
      initialDate: DateTime.now(), //초기값
      firstDate: DateTime(2020), //시작일
      lastDate: DateTime(2023), //마지막일
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark(), //다크 테마
          child: child!,
        );
      },
    );

    selectedDate.then((dateTime) {
      Fluttertoast.showToast(
        msg: dateTime.toString(),
        toastLength: Toast.LENGTH_LONG,
        //gravity: ToastGravity.CENTER,  //위치(default 는 아래)
      );
    });
  }

  // Container _buildLessonContentBox(Function scrollAnimate, String text, String content, int lines) {
  //   return;
  // }

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
        "클래스 등록하기",
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
