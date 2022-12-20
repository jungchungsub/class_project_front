import 'package:finalproject_front/dto/request/lesson_req_dto.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

import '../../../constants.dart';
import '../../../size.dart';

class LessonDeadLine extends StatefulWidget {
  late TextEditingController fieldController = TextEditingController();
  final LessonInsertReqDto lessonInsertReqDto;
  LessonDeadLine({required this.lessonInsertReqDto, required TextEditingController fieldController, Key? key}) : super(key: key);

  @override
  State<LessonDeadLine> createState() => _LessonDeadLineState();
}

class _LessonDeadLineState extends State<LessonDeadLine> {
  TextEditingController dateInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "마감일자",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: gap_m),
          Container(
              decoration: BoxDecoration(),
              child: Center(
                  child: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: gClientColor, width: 3.0),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  //마우스 올리고 난 후 스타일
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: gClientColor, width: 3.0),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                controller: dateInput,
                //TextField의 편집 컨트롤러
                readOnly: true,
                //true로 설정하면 사용자가 텍스트를 편집할 수 없습니다.
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      //DateTime.now() - 오늘 전에는 선택못하게
                      lastDate: DateTime(2100));

                  if (pickedDate != null) {
                    print(pickedDate); //pickDate 출력 형식 => 2021-03-10 00:00:00.000
                    String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                    setState(() {
                      dateInput.text = formattedDate; //출력 날짜를 TextField 값으로 설정합니다.
                      Logger().d(dateInput.text);
                      widget.lessonInsertReqDto.deadline = formattedDate;
                    });
                  } else {}
                },
              ))),
        ],
      ),
    );
  }
}
