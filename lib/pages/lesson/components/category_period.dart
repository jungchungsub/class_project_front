import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/dto/request/lesson_req_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class selectedCarrerButton extends ConsumerStatefulWidget {
  late LessonInsertReqDto lessonInsertReqDto;
  selectedCarrerButton({required LessonInsertReqDto lessonInsertReqDto, Key? key}) : super(key: key);

  @override
  ConsumerState<selectedCarrerButton> createState() => _selectedCarrerButtonState();
}

class _selectedCarrerButtonState extends ConsumerState<selectedCarrerButton> {
  final List<String> items = [
    '뷰티',
    '운동',
    '댄스',
    '뮤직',
    '미술',
    '문학',
    '공예',
    '기타',
  ];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String?>(
          hint: Text(
            '카테고리를 선택해주세요',
            style: TextStyle(
              fontSize: 16,
              color: gSubTextColor,
            ),
          ),

          onChanged: (String? newValue) {
            widget.lessonInsertReqDto.categoryId = int.parse(newValue!);
            print(newValue);
          },
          items: [null, '1', '2', '3', '4', '5', '6', '7', '8'].map<DropdownMenuItem<String?>>((String? i) {
            return DropdownMenuItem<String?>(
              value: i,
              child: Text({
                    '1': '뷰티',
                    '2': '운동',
                    '3': '댄스',
                    '4': '뮤직',
                    '5': '미술',
                    '6': '문학',
                    '7': '공예',
                    '8': '기타',
                  }[i] ??
                  '미선택'),
            );
          }).toList(),
          // items: items
          //     .map((item) => DropdownMenuItem<String>(
          //           value: item,
          //           child: Text(
          //             item,
          //             style: const TextStyle(fontSize: 14, color: Colors.black),
          //           ),
          //         ))
          //     .toList(),
          // value: selectedValue,
          // onChanged: (value) {
          //   setState(() {
          //     Logger().d("전 ${value}");
          //     selectedValue = value as String;
          //     Logger().d("값넣기 후 ${selectedValue}");
          //     widget.lessonInsertReqDto.categoryId = int.parse(selectedValue!);
          //   });
          // },
        ),
      ),
    );
  }
}
