import 'dart:io';

import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/size.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImageInsertButton extends StatefulWidget {
  const ProfileImageInsertButton({Key? key}) : super(key: key);

  @override
  State<ProfileImageInsertButton> createState() => _ProfileImageInsertButtonState();
}

class _ProfileImageInsertButtonState extends State<ProfileImageInsertButton> {
  XFile? _pickedFile;
  final ImagePicker imgpicker = ImagePicker();
  XFile? imagefile;

  @override
  Widget build(BuildContext context) {
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
      print("Getting Image from Gallery.");
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
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(150),
                  child: Image.file(
                    File(imagefile!.path),
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
}
