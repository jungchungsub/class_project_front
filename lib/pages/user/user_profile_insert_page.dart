import 'dart:convert';
import 'dart:io';

import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/dto/response/profile_resp_dto.dart';
import 'package:finalproject_front/pages/components/custom_text_field.dart';
import 'package:finalproject_front/pages/user/components/profile_career_select_button.dart';
import 'package:finalproject_front/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

class UserProfileInsertPage extends ConsumerStatefulWidget {
  final ProfileRespDto model;
  final _profileIntroduction = TextEditingController();
  final _profileRegion = TextEditingController();
  final _profileCertification = TextEditingController();
  final _profileCareer = TextEditingController();
  final _profileCareerYear = TextEditingController();
  UserProfileInsertPage({required this.model, super.key});

  @override
  ConsumerState<UserProfileInsertPage> createState() => _UserProfileInsertPageState();
}

class _UserProfileInsertPageState extends ConsumerState<UserProfileInsertPage> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = new ScrollController();
  }

  XFile? pickedFile;
  ImagePicker imgpicker = ImagePicker();
  XFile? _imagefile;
  late List<String>? profileImage;

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

  Widget build(BuildContext context) {
    widget._profileIntroduction.text = widget.model.introduction;
    widget._profileRegion.text = widget.model.region;
    widget._profileCertification.text = widget.model.certification;
    widget._profileCareer.text = widget.model.career;

    return Scaffold(
      appBar: _buildAppbar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(gap_l),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildImageUploder(),
              SizedBox(height: gap_l),
              _buildProfileId(context, "green1234"),
              SizedBox(height: gap_l),
              CustomTextField(
                scrollAnimate,
                fieldTitle: "자기소개",
                hint: "간략한 자기소개를 작성해주세요.",
                lines: 6,
                fieldController: widget._profileIntroduction,
              ),
              SizedBox(height: gap_l),
              CustomTextField(scrollAnimate, fieldTitle: "지역을 작성해주세요.", hint: "예)부산,서울,경기도", lines: 1, fieldController: widget._profileRegion),
              SizedBox(height: gap_l),
              CustomTextField(scrollAnimate,
                  fieldTitle: "학력 전공을 작성해주세요", hint: "예)사이버 보안전공", lines: 1, subTitle: "선택사항", fieldController: widget._profileCertification),
              SizedBox(height: gap_l),
              ProfileCareerSeleteButton(), // 총 경력 기간
              SizedBox(height: gap_l),
              CustomTextField(scrollAnimate, fieldTitle: "경력사항을 작성해주세요.", hint: "예)프리랜서1년", lines: 1, fieldController: widget._profileCareer),
              SizedBox(height: gap_l),
              // CustomMainButton(buttonRoutePath: "/profileDetail", buttonText: "저장하기"),
              _buildProfileSaveButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileSaveButton() {
    return ElevatedButton(
      onPressed: () {
        Logger().d("profile 인코딩 :${profileImage}");
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: gButtonOffColor,
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            "저장하기",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Row _buildImageUploder() {
    return Row(
      children: [
        //open button ----------------
        _imagefile != null
            ? Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(150),
                  child: Image.file(
                    File(_imagefile!.path),
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              )
            : Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: gBorderColor),
                  borderRadius: BorderRadius.circular(50),
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
                    Logger().d(openImages());
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

  Widget _builderImageUploader() {
    return Row(
      children: [
        //open button ----------------

        _imagefile != null
            ? Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(150),
                  child: Image.file(
                    File(_imagefile!.path),
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              )
            : Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: gBorderColor),
                  borderRadius: BorderRadius.circular(50),
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

  AppBar _buildAppbar(BuildContext context) {
    return AppBar(
      elevation: 1,
      centerTitle: true,
      title: Text(
        "프로필 등록/수정",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      leading: IconButton(
          icon: Icon(
            CupertinoIcons.back,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          }),
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

Widget _buildProfileId(BuildContext context, String userId) {
  return Container(
    child: Column(
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
    ),
  );
}
