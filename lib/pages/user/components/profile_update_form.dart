import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

import '../../../constants.dart';
import '../../../controller/user_controller.dart';
import '../../../dto/response/profile_resp_dto.dart';
import '../../../size.dart';

class ProfileUpdateForm extends ConsumerStatefulWidget {
  ProfileRespDto model;

  final _introduction = TextEditingController();
  final _region = TextEditingController();
  final _certification = TextEditingController();
  final _career = TextEditingController();
  ProfileUpdateForm({required this.model, super.key});

  @override
  ConsumerState<ProfileUpdateForm> createState() => _ProfileInsertFormState();
}

class _ProfileInsertFormState extends ConsumerState<ProfileUpdateForm> {
  XFile? pickedFile;
  ImagePicker imgpicker = ImagePicker();
  XFile? _imagefile;
  late String? profileImage;
  final List<String> items = ['신입', '2~3년', '4~7년', '7~10년'];
  String? selectedValue; // ValueNotifier 변수 선언

  final _formKey = GlobalKey<FormState>(); // 글로벌 key
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = new ScrollController();
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
    widget._introduction.text = widget.model.introduction;
    widget._region.text = widget.model.region;
    widget._certification.text = widget.model.certification;
    widget._career.text = widget.model.career;
    Size size = MediaQuery.of(context).size;
    final UserController userCT = ref.read(userController);
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
            padding: const EdgeInsets.all(gap_l),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildImageUploader(),
                SizedBox(height: gap_l),
                _buildProfileId("${widget.model.user.username}"),
                SizedBox(height: gap_l),
                _buildTextField(
                  scrollAnimate,
                  fieldTitle: "자기소개",
                  hint: "자기소개를 간단하게 입력해주세요",
                  lines: 6,
                  fieldController: widget._introduction,
                ),
                SizedBox(height: gap_l),
                _buildTextField(
                  scrollAnimate,
                  fieldTitle: "학력 전공을 작성해주세요",
                  hint: "예예)사이버 보안전공",
                  lines: 1,
                  fieldController: widget._certification,
                ),
                SizedBox(height: gap_l),
                _buildTextField(
                  scrollAnimate,
                  fieldTitle: "지역을 작성해주세요",
                  hint: "예)사이버 보안전공",
                  subTitle: "선택사항",
                  lines: 1,
                  fieldController: widget._region,
                ),
                SizedBox(height: gap_l),
                _selectedCareerButton(size),
                SizedBox(height: gap_l),
                _buildTextField(
                  scrollAnimate,
                  fieldTitle: "경력사항을 작성해주세요",
                  hint: "예)프리랜서1년",
                  lines: 1,
                  fieldController: widget._career,
                ),
                SizedBox(height: gap_l),
                ElevatedButton(
                  onPressed: () {
                    userCT.insertProfile(
                        id: widget.model.user.id,
                        introduction: widget._introduction.text,
                        region: widget._region.text,
                        certification: widget._certification.text,
                        careerYear: selectedValue,
                        career: widget._career.text,
                        filePath: profileImage);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: gButtonOffColor,
                    minimumSize: Size(getScreenWidth(context), 60),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "프로필 수정",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }

  Widget _selectedCareerButton(Size size) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "총 경력 기간을 선택해 주세요.",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: gClientColor, width: 3),
            borderRadius: BorderRadius.circular(10),
          ),
          width: size.width,
          height: 60,
          child: DropdownButtonHideUnderline(
            child: DropdownButton2(
              hint: Text(
                '경력 기간을 선택 주세요.',
                style: TextStyle(fontSize: 16, color: gSubTextColor, fontWeight: FontWeight.bold),
              ),
              items: items
                  .map(
                    (item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 16,
                          color: gSubTextColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                  .toList(),
              value: selectedValue,
              onChanged: (String? value) {
                setState(() {
                  selectedValue = value!;
                });
              },
            ),
          ),
        )
      ],
    );
  }

  Widget _buildImageUploader() {
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

  Widget _buildProfileId(String userId) {
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
}

Widget _buildTextField(
  Function scrollAnimate, {
  required String fieldTitle,
  required String hint,
  String? subTitle,
  required int lines,
  required TextEditingController fieldController,
}) {
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
