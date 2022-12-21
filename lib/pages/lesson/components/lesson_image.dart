import 'dart:io';

import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/pages/user/components/profile_image.dart';
import 'package:finalproject_front/size.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

class LessonImage extends StatefulWidget {
  const LessonImage({Key? key}) : super(key: key);

  @override
  State<LessonImage> createState() => _LessonImageState();
}

class _LessonImageState extends State<LessonImage> {
  XFile? _pickedFile;
  final ImagePicker imgpicker = ImagePicker();
  XFile? imagefile;

  @override
  Widget build(BuildContext context) {
    final _imageSize = MediaQuery.of(context).size.width / 4;
    Logger().d("image 위젯들어옴?");
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
                decoration: BoxDecoration(
                  border: Border.all(color: gBorderColor),
                  borderRadius: BorderRadius.circular(15),
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
                    Logger().d("리턴 ${ProfileImage}");
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
