import 'dart:convert';
import 'dart:typed_data';

import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/controller/lesson_controller.dart';
import 'package:finalproject_front/dto/response/lesson_resp_dto.dart';

import 'package:finalproject_front/pages/components/custom_text_field.dart';
import 'package:finalproject_front/pages/lesson/components/category_select.dart';
import 'package:finalproject_front/pages/lesson/components/lesson_deadline.dart';
import 'package:finalproject_front/pages/lesson/components/lesson_image.dart';

import 'package:finalproject_front/size.dart';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:image_picker/image_picker.dart';
import 'dart:io';

class LessonInsertForm extends ConsumerStatefulWidget {
  // LessonInsertRespDto model;
  LessonInsertForm({Key? key}) : super(key: key);
  // required this.model,
  @override
  ConsumerState<LessonInsertForm> createState() => _LessonInsertFormState();
}

class _LessonInsertFormState extends ConsumerState<LessonInsertForm> {
  XFile? pickedFile;
  ImagePicker imgpicker = ImagePicker();
  XFile? _imagefile;
  late List<String>? profileImage;

  final _formKey = GlobalKey<FormState>();
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = new ScrollController();
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

  openImages() async {
    try {
      var pickedfile = await imgpicker.pickImage(source: ImageSource.gallery);
      //you can use ImageCourse.camera for Camera capture
      if (pickedfile != null) {
        _imagefile = pickedfile;
        setState(() {}); // 상태 초기화
        Uint8List? data = await _imagefile?.readAsBytes();
        List<String> profileImage = [base64Encode(data!)];
        return this.profileImage = profileImage;
      } else {
        print("No image is selected.");
      }
    } catch (e) {
      print("error while picking file.");
    }
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

  @override
  Widget build(BuildContext context) {
    final lessonCT = ref.read(lessonController);
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                LessonImage(),
                CustomTextField(scrollAnimate, fieldTitle: "서비스제목", hint: "서비스 제목자리입니다", lines: 1),
                SizedBox(height: gap_l),
                CustomTextField(scrollAnimate, fieldTitle: "커리큘럼", hint: "상세설명", lines: 6),
                SizedBox(height: gap_l),
                CustomTextField(scrollAnimate, fieldTitle: "수강횟수", hint: "수강 횟수를 입력하세요", lines: 1),
                SizedBox(height: gap_l),
                CustomTextField(scrollAnimate, fieldTitle: "수강시간", hint: "수강 시간을 입력하세요", lines: 1),
                SizedBox(height: gap_l),
                CustomTextField(scrollAnimate, fieldTitle: "수강장소", hint: "ex) 부산시 진구 그린아카데미", lines: 1),
                CategorySelecter(),
                SizedBox(height: gap_l),
                LessonDeadLine(),
                SizedBox(height: gap_l),
                _buildLessonButton(context)
              ],
            ),
          ),
        ],
      ),
    );
  }

  ElevatedButton _buildLessonButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        primary: gButtonOffColor,
        minimumSize: Size(getScreenWidth(context), 60),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          "클래스 등록하기",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
