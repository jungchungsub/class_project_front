import 'dart:convert';
import 'dart:io';

import 'package:finalproject_front/domain/user_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

import '../../../constants.dart';
import '../../../controller/user_controller.dart';
import '../../../dto/request/profile_req_dto.dart';
import '../../../size.dart';

// ignore: must_be_immutable
class ProfileInsertForm extends ConsumerStatefulWidget {
  ProfileInsertForm({super.key, required this.username, required this.profileInsertReqDto});
  late ProfileInsertReqDto profileInsertReqDto;
  String username;
  static const String defaultProfile = "assets/defaultProfile.jpeg";

  @override
  ConsumerState<ProfileInsertForm> createState() => _ProfileInsertFormState();
}

class _ProfileInsertFormState extends ConsumerState<ProfileInsertForm> {
  XFile? _imagefile;
  ImagePicker imgpicker = ImagePicker();
  late String? profileImage;

  final _formKey = GlobalKey<FormState>(); // 글로벌 key
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  openImages() async {
    dynamic sendImage;
    var pickedfile = await imgpicker.pickImage(source: ImageSource.gallery);

    if (pickedfile != null) {
      _imagefile = pickedfile;
      setState(() {});

      // 이미지의 디바이스 경로
      sendImage = _imagefile?.path;
      final encodeImage = utf8.encode(sendImage);
      List<int> data = encodeImage;
      String profileImage = base64Encode(data);

      return this.profileImage = profileImage;
    }
  }

  void scrollAnimate() {
    Future.delayed(Duration(milliseconds: 600), () {
      scrollController.animateTo(MediaQuery.of(context).viewInsets.bottom, duration: Duration(microseconds: 100), curve: Curves.easeIn);
    });
  }

  @override
  Widget build(BuildContext context) {
    final UserController userCT = ref.read(userController);
    return SingleChildScrollView(
        child: Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(gap_l),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          _buildImageUploader(),
          SizedBox(height: gap_l),
          _buildProfileId(widget.username),
          SizedBox(height: gap_l),
          _buildTextField(
            scrollAnimate,
            fieldTitle: "자기소개",
            hint: "자기소개를 간단하게 입력해주세요",
            lines: 6,
            onChanged: (value) {
              widget.profileInsertReqDto.introduction = value;
            },
          ),
          SizedBox(height: gap_l),
          _buildTextField(
            scrollAnimate,
            fieldTitle: "학력 전공을 작성해주세요",
            hint: "예)사이버 보안전공",
            lines: 1,
            onChanged: (value) {
              widget.profileInsertReqDto.certification = value;
            },
          ),
          SizedBox(height: gap_l),
          _buildTextField(
            scrollAnimate,
            fieldTitle: "지역을 작성해주세요",
            hint: "예)사이버 보안전공",
            subTitle: "선택사항",
            lines: 1,
            onChanged: (value) {
              widget.profileInsertReqDto.region = value;
            },
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
                child: DropdownButtonFormField<String?>(
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
                  onChanged: (String? newValue) {
                    widget.profileInsertReqDto.careerYear = newValue;
                  },
                  items: ['신입', '2~3년', '4~7년', '8~10년'].map<DropdownMenuItem<String?>>((String? i) {
                    return DropdownMenuItem<String?>(
                      value: i,
                      child: Text({'신입': '신입', '2~3년': '2~3년', '4~7년': '4~7년', '8~10년': '8~10년'}[i] ?? '미선택'),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: gap_l),
              _buildTextField(
                scrollAnimate,
                fieldTitle: "경력사항을 작성해주세요",
                hint: "예)프리랜서1년",
                lines: 1,
                onChanged: (value) {
                  widget.profileInsertReqDto.career = value;
                },
              ),
              SizedBox(height: gap_l),
              ElevatedButton(
                onPressed: () {
                  widget.profileInsertReqDto.filePath = profileImage;
                  Logger().d("인코딩 이미지 확인 ${widget.profileInsertReqDto.filePath}");
                  userCT.insertProfile(
                    userId: UserSession.user.id,
                    profileInsertReqDto: widget.profileInsertReqDto,
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: gButtonOffColor,
                  minimumSize: Size(getScreenWidth(context), 60),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "프로필 등록",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          )
        ]),
      ),
    ));
  }

  Widget _buildImageUploader() {
    return Row(
      children: [
        //open button ----------------
        _imagefile != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(150),
                child: Image.file(
                  File(_imagefile!.path),
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(150),
                child: Image.asset(
                  // 이미지 파일이 null이면 기본 이미지 띄우기
                  ProfileInsertForm.defaultProfile,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
        SizedBox(width: gap_m),
        SizedBox(
          height: 90,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "프로필 사진 등록",
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

  Widget _buildProfileId(String userId) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "아이디",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 10),
        TextFormField(
          readOnly: true,
          decoration: InputDecoration(
            hintText: userId,
            hintStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: Colors.black,
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
    );
  }
}

Widget _buildTextField(
  Function scrollAnimate, {
  required String fieldTitle,
  required String hint,
  String? subTitle,
  required int lines,
  ValueChanged<String>? onChanged,
}) {
  return Column(
    children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: fieldTitle,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              if (subTitle != null)
                TextSpan(
                  text: subTitle,
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
        keyboardType: TextInputType.multiline,
        maxLines: lines,
        decoration: InputDecoration(
          hintText: hint,
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
  );
}
