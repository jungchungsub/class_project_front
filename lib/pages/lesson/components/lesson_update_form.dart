import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/controller/lesson_controller.dart';
import 'package:finalproject_front/dto/request/lesson_req_dto.dart';
import 'package:finalproject_front/dto/request/lesson_update_info.dart';
import 'package:finalproject_front/pages/lesson/lesson_detail_page/model/lesson_detail_page_model.dart';
import 'package:finalproject_front/pages/lesson/lesson_master_list/model/lesson_master_list_model.dart';
import 'package:finalproject_front/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import 'package:logger/logger.dart';

import 'lesson_deadline.dart';

class LessonUpdateForm extends ConsumerStatefulWidget {
  final _name = TextEditingController();
  final _curriculum = TextEditingController();
  final _place = TextEditingController();
  final _policy = TextEditingController();
  late var _count = TextEditingController();
  late var _dateInput = TextEditingController();
  late var _time = TextEditingController();
  late var _price = TextEditingController();
  late var _possibleDay = TextEditingController();
  // var _count = TextEditingController();
  // late final _count;
  LessonDetailPageModel model;

  late LessonUpdateReqDto lessonUpdateReqDto;
  LessonUpdateForm({required this.model, required this.lessonUpdateReqDto, Key? key}) : super(key: key);

  @override
  ConsumerState<LessonUpdateForm> createState() => _LessonInsertFormState();
}

class _LessonInsertFormState extends ConsumerState<LessonUpdateForm> {
  XFile? pickedFile;
  ImagePicker imgpicker = ImagePicker();
  XFile? _imagefile;
  late String profileImage;
  // ValueChanged<T> select;

  final _formKey = GlobalKey<FormState>();
  late ScrollController scrollController;

  @override
  void initState() {
    widget._name.text = widget.model.lessonRespDto.lessonDto.lessonName;
    widget._curriculum.text = widget.model.lessonRespDto.lessonDto.curriculum;
    widget._count.text = widget.model.lessonRespDto.lessonDto.lessonCount.toString();
    widget._place.text = widget.model.lessonRespDto.lessonDto.lessonPlace;
    widget._policy.text = widget.model.lessonRespDto.lessonDto.lessonPolicy;
    widget._dateInput.text = '';
    widget._time.text = widget.model.lessonRespDto.lessonDto.lessonTime.toString();
    widget._price.text = widget.model.lessonRespDto.lessonDto.lessonPrice.toString();
    widget._possibleDay.text = '';

    super.initState();
    scrollController = ScrollController();
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
      dynamic sendImage; // 디바이스 경로

      var pickedfile = await imgpicker.pickImage(source: ImageSource.gallery);
      //you can use ImageCourse.camera for Camera capture
      if (pickedfile != null) {
        _imagefile = pickedfile;
        setState(() {}); // 상태 초기화

        sendImage = _imagefile?.path;
        final encodeImage = utf8.encode(sendImage);
        List<int> data = encodeImage;
        String profileImage = base64Encode(data);

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
      scrollController.animateTo(MediaQuery.of(context).viewInsets.bottom,
          duration: Duration(microseconds: 100), // 0.1초 이후 field가 올라간다.
          curve: Curves.easeIn); //Curves - 올라갈때 애니메이션
    });
  }

  @override
  Widget build(BuildContext context) {
    LessonUpdateReqDto lessonUpdateReqDto = LessonUpdateReqDto.single();

    final lessonCT = ref.read(lessonController);
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                _buildImageUploader(widget.lessonUpdateReqDto),
                SizedBox(
                  height: gap_m,
                ),
                _buildTextField(scrollAnimate, fieldTitle: "서비스제목", hint: "서비스 제목자리입니다", lines: 1, fieldController: widget._name, onChanged: (value) {
                  widget.lessonUpdateReqDto.name = value;
                }),
                SizedBox(height: gap_l),
                _buildTextField(scrollAnimate, fieldTitle: "커리큘럼", hint: "상세설명", lines: 6, fieldController: widget._curriculum, onChanged: (value) {
                  widget.lessonUpdateReqDto.curriculum = value;
                }),
                SizedBox(height: gap_l),
                _buildTextField(
                  scrollAnimate,
                  fieldTitle: "수강횟수",
                  hint: "수강횟수를 입력하세요",
                  lines: 1,
                  fieldController: widget._count,
                  onChanged: (value) {
                    widget.lessonUpdateReqDto.lessonCount = int.parse(value);
                  },
                ),
                SizedBox(height: gap_l),
                _buildTextField(
                  scrollAnimate,
                  fieldTitle: "수강시간",
                  hint: "수강시간을 입력하세요",
                  lines: 1,
                  fieldController: widget._time,
                  onChanged: (value) {
                    widget.lessonUpdateReqDto.lessonTime = int.parse(value);
                  },
                ),
                SizedBox(height: gap_l),
                _buildTextField(
                  scrollAnimate,
                  fieldTitle: "수강장소",
                  hint: "수강장소를 입력하세요",
                  lines: 1,
                  fieldController: widget._place,
                  onChanged: (value) {
                    widget.lessonUpdateReqDto.place = value;
                  },
                ),
                SizedBox(height: gap_l),
                _buildTextField(
                  scrollAnimate,
                  fieldTitle: "가격",
                  hint: "가격을 입력하세요",
                  lines: 1,
                  fieldController: widget._price,
                  onChanged: (value) {
                    widget.lessonUpdateReqDto.price = int.parse(value);
                  },
                ),
                SizedBox(height: gap_l),
                _buildTextField(
                  scrollAnimate,
                  fieldTitle: "취소 및 환불 정책",
                  hint: "취소 및 환불 정책 작성",
                  lines: 4,
                  fieldController: widget._policy,
                  onChanged: (value) {
                    widget.lessonUpdateReqDto.policy = value;
                  },
                ),
                SizedBox(height: gap_l),
                _buildTextField(
                  scrollAnimate,
                  fieldTitle: "가능일",
                  hint: "가능일을 입력하세요",
                  lines: 1,
                  fieldController: widget._possibleDay,
                  onChanged: (value) {
                    widget.lessonUpdateReqDto.possibleDays = value;
                  },
                ),
                SizedBox(height: gap_l),
                LessonDeadLine(
                  fieldController: widget._dateInput,
                  lessonUpdateReqDto: lessonUpdateReqDto,
                ),
                SizedBox(height: gap_l),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "카테고리선택",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: gap_m),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: gBorderColor, width: 3),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: DropdownButtonFormField<int?>(
                        decoration: InputDecoration(
                          hintText: '카테고리 선택',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          //마우스 올리고 난 후 스타일
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),

                        // underline: Container(height: 1.4, color: Color(0xffc0c0c0)),
                        onChanged: (int? newValue) {
                          lessonUpdateReqDto.categoryId = newValue!;
                        },
                        items: [1, 2, 3, 4, 5, 6, 7, 8].map<DropdownMenuItem<int?>>((int? i) {
                          return DropdownMenuItem<int?>(
                            value: i,
                            child: Text({1: '뷰티', 2: '운동', 3: '댄스', 4: '뮤직', 5: '미술', 6: '문학', 7: '공예', 8: '기타'}[i] ?? '미선택'),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: gap_l),
                ElevatedButton(
                  onPressed: () {
                    lessonUpdateReqDto.photo = profileImage;
                    lessonCT.updateLesson(lessonId: 1, lessonUpdateReqDto: lessonUpdateReqDto);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: gButtonOffColor,
                    minimumSize: Size(getScreenWidth(context), 60),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "클래스 수정하기",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageUploader(LessonUpdateReqDto lessonUpdateReqDto) {
    return Row(
      children: [
        //open button ----------------
        _imagefile != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.file(
                  File(_imagefile!.path),
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
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
      required ValueChanged onChanged}) {
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
}
