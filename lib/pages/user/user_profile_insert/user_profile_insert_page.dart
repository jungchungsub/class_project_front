import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/pages/sign/components/custom_text_form_field.dart';
import 'package:finalproject_front/pages/user/user_detail/components/image_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserProfileInsertPage extends StatelessWidget {
  const UserProfileInsertPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _buildAppbar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(150),
              child: Image.asset(
                "assets/picture.jpg",
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "아이디",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.normal),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: "green1234",
                      hintStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                      //3. 기본 textFormfield 디자인 - enabledBorder
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffD9D9D9), width: 3.0),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      //마우스 올리고 난 후 스타일
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffD9D9D9), width: 3.0),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "간략한 자기 소개를 작성해 주세요",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.normal),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 6,
                    decoration: InputDecoration(
                      hintText: "간략한 자기소개를 작성해주세요",
                      hintStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: gSubTextColor,
                      ),
                      //3. 기본 textFormfield 디자인 - enabledBorder
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: gBorderColor, width: 3.0),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      //마우스 올리고 난 후 스타일
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: gBorderColor, width: 3.0),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "지역을 작성해주세요.",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.normal),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "예) 부산, 서울, 경기도 등등...",
                      hintStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: gSubTextColor,
                      ),
                      //3. 기본 textFormfield 디자인 - enabledBorder
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: gBorderColor, width: 3.0),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      //마우스 올리고 난 후 스타일
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: gBorderColor, width: 3.0),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
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
}
