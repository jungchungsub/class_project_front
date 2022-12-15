import 'dart:convert';
import 'dart:typed_data';

import 'package:dropdown_button2/dropdown_button2.dart';

import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/controller/lesson_controller.dart';
import 'package:finalproject_front/dto/request/lesson_req_dto.dart';

import 'package:finalproject_front/size.dart';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

import 'lesson_deadline.dart';

class LessonInsertForm extends ConsumerStatefulWidget {
  final _name = TextEditingController();
  final _curriculum = TextEditingController();
  final _count = TextEditingController();
  final _place = TextEditingController();
  final _policy = TextEditingController();
  final _dateInput = TextEditingController();
  final _time = TextEditingController();
  final _price = TextEditingController();
  final _possibleDay = TextEditingController();

  LessonInsertForm({Key? key}) : super(key: key);

  @override
  ConsumerState<LessonInsertForm> createState() => _LessonInsertFormState();
}

class _LessonInsertFormState extends ConsumerState<LessonInsertForm> {
  XFile? pickedFile;
  ImagePicker imgpicker = ImagePicker();
  XFile? _imagefile;
  late String profileImage;
  // ValueChanged<T> select;

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
        String profileImage = base64Encode(data!);
        Logger().d("리턴전 : ${profileImage}");
        return this.profileImage = profileImage;
      } else {
        print("No image is selected.");
        Logger().d("이미지 선택x");
      }
    } catch (e) {
      print("error while picking file.");
      Logger().d("이미지 오류");
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
    LessonInsertReqDto lessonInsertReqDto = LessonInsertReqDto.origin();
    final lessonCT = ref.read(lessonController);
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                _buildImageUploader(onChanged: (value) {
                  lessonInsertReqDto.photo = value;
                }),
                _buildTextField(scrollAnimate, fieldTitle: "서비스제목", hint: "서비스 제목자리입니다", lines: 1, fieldController: widget._name, onChanged: (value) {
                  lessonInsertReqDto.name = value;
                }),
                SizedBox(height: gap_l),
                _buildTextField(scrollAnimate, fieldTitle: "커리큘럼", hint: "상세설명", lines: 6, fieldController: widget._curriculum, onChanged: (value) {
                  lessonInsertReqDto.curriculum = value;
                }),
                SizedBox(height: gap_l),
                _buildTextField(scrollAnimate, fieldTitle: "수강횟수", hint: "수강횟수를 입력하세요", lines: 1, fieldController: widget._count, onChanged: (value) {
                  lessonInsertReqDto.lessonCount = int.parse(value);
                }),
                SizedBox(height: gap_l),
                _buildTextField(scrollAnimate, fieldTitle: "수강시간", hint: "수강시간을 입력하세요", lines: 1, fieldController: widget._time, onChanged: (value) {
                  lessonInsertReqDto.lessonTime = int.parse(value);
                }),
                SizedBox(height: gap_l),
                _buildTextField(scrollAnimate, fieldTitle: "수강장소", hint: "수강장소를 입력하세요", lines: 1, fieldController: widget._place, onChanged: (value) {
                  lessonInsertReqDto.place = value;
                }),
                SizedBox(height: gap_l),
                _buildTextField(scrollAnimate, fieldTitle: "가격", hint: "가격를 입력하세요", lines: 1, fieldController: widget._price, onChanged: (value) {
                  lessonInsertReqDto.price = int.parse(value);
                }),
                SizedBox(height: gap_l),
                _buildTextField(scrollAnimate, fieldTitle: "취소 및 환불 정책", hint: "취소 및 환불 정책 작성", lines: 4, fieldController: widget._policy,
                    onChanged: (value) {
                  lessonInsertReqDto.policy = value;
                }),
                SizedBox(height: gap_l),
                _buildTextField(scrollAnimate, fieldTitle: "가능일", hint: "가능일을 입력하세요", lines: 1, fieldController: widget._possibleDay,
                    onChanged: (value) {
                  lessonInsertReqDto.possibleDays = value;
                }),
                SizedBox(height: gap_l),
                LessonDeadLine(
                  fieldController: widget._dateInput,
                  lessonInsertReqDto: lessonInsertReqDto,
                ),
                SizedBox(height: gap_l),

                ElevatedButton(
                  onPressed: () {
                    lessonCT.lessonInsert(
                      lessonInsertReqDto: lessonInsertReqDto,
                    );
                  },
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
                )
                // _buildLessonButton(context)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageUploader({required ValueChanged<String>? onChanged}) {
    return Row(
      children: [
        //open button ----------------
        _imagefile != null
            ? Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.file(
                    File(_imagefile!.path),
                    width: 200,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              )
            : Container(
                width: 200,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: gBorderColor),
                  borderRadius: BorderRadius.circular(10),
                ),
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

  Widget _buildTextField(Function scrollAnimate,
      {required String fieldTitle,
      required String hint,
      String? subTitle,
      required int lines,
      required TextEditingController fieldController,
      required ValueChanged<String>? onChanged}) {
    return Container(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "${fieldTitle}",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  if (subTitle != null)
                    TextSpan(
                      text: "${subTitle}",
                      style: TextStyle(color: gSubTextColor, fontSize: 10, fontWeight: FontWeight.bold),
                    )
                ],
              ),
            ),
          ),
          SizedBox(height: gap_m),
          TextFormField(
            onTap: (() {
              scrollAnimate;
            }),
            onChanged: onChanged,
            controller: fieldController,
            keyboardType: TextInputType.multiline,
            maxLines: lines,
            decoration: InputDecoration(
              hintText: "${hint}",
              hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: gSubTextColor,
              ),
              //3. 기본 textFormfield 디자인 - enabledBorder
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
          ),
        ],
      ),
    );
  }

  // ElevatedButton _buildLessonButton(BuildContext context) {
  //   final lessonCT = ref.watch(lessonController);
  //   return ElevatedButton(
  //     onPressed: () {
  //       Logger().d("버튼실행");
  //       Logger().d(profileImage);
  //       Logger().d("장소 잘가져와지니,,? ${widget._place}");
  //       Logger().d("날짜 잘가져와지니,,,?   ${widget._place}");
  //       Logger().d("가능날짜 잘가져와지니..? ${selectedValue} ");
  //       lessonCT.lessonInsert(
  //         name: widget._name.text,
  //         photo: profileImage,
  //         price: int.parse(widget._price.text),
  //         place: widget._place.text,
  //         lessonTime: int.parse(widget._time.text),
  //         lessonCount: int.parse(widget._count.text),
  //         possibleDays: selectedValue,
  //         curriculum: widget._curriculum.text,
  //         policy: widget._policy.text,
  //         deadline: DateTime.parse(widget._dateInput.text),
  //       );
  //     },
  //     style: ElevatedButton.styleFrom(
  //       primary: gButtonOffColor,
  //       minimumSize: Size(getScreenWidth(context), 60),
  //     ),
  //     child: Align(
  //       alignment: Alignment.center,
  //       child: Text(
  //         "클래스 등록하기",
  //         style: TextStyle(
  //           fontSize: 18,
  //           fontWeight: FontWeight.bold,
  //           color: Colors.white,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _selectCarrer() {
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
            child: _selectedCarrerButton(),
            width: 400,
            height: 60,
          )
        ],
      ),
    );
  }

  Widget _selectedCarrerButton() {
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
