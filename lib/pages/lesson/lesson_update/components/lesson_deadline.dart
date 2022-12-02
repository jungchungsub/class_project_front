import 'package:finalproject_front/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:finalproject_front/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LessonDeadLine extends StatefulWidget {
  const LessonDeadLine({Key? key}) : super(key: key);

  @override
  State<LessonDeadLine> createState() => _LessonDeadLineState();
}

class _LessonDeadLineState extends State<LessonDeadLine> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "마감일자",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10),
          TextButton(
            onPressed: () {
              _buildShowDatePickerPop();
            },
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(color: gBorderColor, width: 3),
                borderRadius: BorderRadius.circular(15),
              ),
              alignment: Alignment.centerLeft,
              child: Text(
                'DatePicker 띄우기',
                style: TextStyle(
                  color: gSubTextColor,
                ),
              ),
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
}
