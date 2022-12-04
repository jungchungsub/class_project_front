import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/pages/components/custom_text_field.dart';
import 'package:finalproject_front/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
                _buildLessonImage(),
                SizedBox(height: gap_l),
                CustomTextField(scrollAnimate, fieldTitle: "서비스제목", hint: "서비스 제목자리입니다", lines: 1),
                SizedBox(height: gap_l),
                CustomTextField(scrollAnimate, fieldTitle: "커리큘럼", hint: "상세설명", lines: 6),
                SizedBox(height: gap_l),
                CustomTextField(scrollAnimate, fieldTitle: "수강횟수", hint: "수강 횟수를 입력하세요", lines: 1),
                SizedBox(height: gap_l),
                CustomTextField(scrollAnimate, fieldTitle: "수강시간", hint: "수강 시간을 입력하세요", lines: 1),
                SizedBox(height: gap_l),
                CustomTextField(scrollAnimate, fieldTitle: "수강장소", hint: "ex) 부산시 진구 그린아카데미", lines: 1),
                SizedBox(height: gap_l),
                _buildLessonCategory(),
                SizedBox(height: gap_l),
                _buildLessonDeadLine(),
                SizedBox(height: gap_l),
                _buildLessonBottomButton(),
                SizedBox(height: gap_l),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column _buildLessonBottomButton() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              style: TextButton.styleFrom(backgroundColor: Color(0xff4880ED), minimumSize: Size(150, 50)),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "수정",
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(backgroundColor: Color(0xff4880ED), minimumSize: Size(150, 50)),
              onPressed: () {
                //Form에서 현재의 상태 값이 null이 아니라면 /home로 push 해준다.
              },
              child: Text(
                "삭제",
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ],
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
          Row(
            children: [
              Text(
                "카테고리 선택",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          SizedBox(height: gap_m),
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

  Container _buildLessonImage() {
    return Container(
      child: Container(
        child: Column(
          children: [
            SizedBox(height: gap_l),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 100,
                    width: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(image: NetworkImage("https://picsum.photos/201"), fit: BoxFit.cover),
                    ),
                  ),
                ),
                SizedBox(width: gap_l),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "클래스 사진 등록",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: gap_l),
                    Text(
                      "apple.jpg",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: gSubTextColor,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 15),
                    InkWell(
                      onTap: (() {
                        //클래스 수정하기로 가는 링크
                      }),
                      child: Container(
                        width: 120,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: gContentBoxColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "사진 수정하기",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: gButtonOffColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        item,
                        style: const TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                      ),
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

class _buildLessonDeadLine extends StatefulWidget {
  const _buildLessonDeadLine({Key? key}) : super(key: key);

  @override
  State<_buildLessonDeadLine> createState() => _buildLessonDeadLineState();
}

class _buildLessonDeadLineState extends State<_buildLessonDeadLine> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '',
                  style: TextStyle(
                    color: gSubTextColor,
                  ),
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
