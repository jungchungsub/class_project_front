import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/pages/components/custom_main_button.dart';
import 'package:finalproject_front/pages/components/custom_text_field.dart';
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
                _buildImageInsert(),
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
                _buildLessonCategory(),
                SizedBox(height: gap_l),
                _buildDeadLine(),
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

  Container _buildLessonCategory() {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                "카테고리 선택",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: gBorderColor, width: 3),
              borderRadius: BorderRadius.circular(15),
            ),
            child: CategoryPeriod(),
            width: 400,
            height: 60,
          )
        ],
      ),
    );
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

class CategoryPeriod extends StatefulWidget {
  const CategoryPeriod({Key? key}) : super(key: key);

  @override
  State<CategoryPeriod> createState() => _CategoryPeriodState();
}

class _CategoryPeriodState extends State<CategoryPeriod> {
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
        child: DropdownButton2(
          hint: Text(
            '카테고리를 선택해주세요',
            style: TextStyle(
              fontSize: 16,
              color: gSubTextColor,
            ),
          ),
          items: items
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ))
              .toList(),
          value: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value as String;
            });
          },
        ),
      ),
    );
  }
}

class _buildDeadLine extends StatefulWidget {
  const _buildDeadLine({Key? key}) : super(key: key);

  @override
  State<_buildDeadLine> createState() => _buildDeadLineState();
}

class _buildDeadLineState extends State<_buildDeadLine> {
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
                      firstDate: DateTime(1950),
                      //DateTime.now() - 오늘 전에는 선택못하게
                      lastDate: DateTime(2100));

                  if (pickedDate != null) {
                    print(
                        pickedDate); //pickDate 출력 형식 => 2021-03-10 00:00:00.000
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                    print(
                        formattedDate); //intl 패키지를 사용하여 형식화된 날짜 출력 =>  2021-03-16
                    setState(() {
                      dateInput.text =
                          formattedDate; //출력 날짜를 TextField 값으로 설정합니다.
                    });
                  } else {}
                },
              ))),
        ],
      ),
    );
  }
}

class _buildImageInsert extends StatefulWidget {
  const _buildImageInsert({Key? key}) : super(key: key);

  @override
  State<_buildImageInsert> createState() => __buildImageInsertState();
}

class __buildImageInsertState extends State<_buildImageInsert> {
  XFile? _pickedFile;
  final ImagePicker imgpicker = ImagePicker();
  XFile? imagefile;

  @override
  Widget build(BuildContext context) {
    final _imageSize = MediaQuery.of(context).size.width / 4;
    return Column(
      children: [
        _builderImageUploader(),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  openImages() async {
    try {
      var pickedfile = await imgpicker.pickImage(source: ImageSource.gallery);
      //you can use ImageCourse.camera for Camera capture
      if (pickedfile != null) {
        imagefile = pickedfile;
        setState(() {});
      } else {
        print("No image is selected.");
      }
    } catch (e) {
      print("error while picking file.");
    }
  }

  Widget _builderImageUploader() {
    return Row(
      children: [
        //open button ----------------
        imagefile != null
            ? Container(
                child: Card(
                child: Container(
                  width: 180,
                  height: 100,
                  child: Image.file(
                    File(imagefile!.path),
                    fit: BoxFit.cover,
                  ),
                ),
              ))
            : Container(
                width: 180,
                height: 100,
              ),
        SizedBox(width: gap_m),
        Container(
          height: 90,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "클래스 사진 등록",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
                width: 140,
                child: ElevatedButton(
                  onPressed: () {
                    openImages();
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: gContentBoxColor,
                    primary: gPrimaryColor,
                  ),
                  child: Text("이미지 선택",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
