import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/models/profile_detail_resp_dto.dart';
import 'package:finalproject_front/pages/components/custom_main_button.dart';
import 'package:finalproject_front/pages/components/custom_text_field.dart';
import 'package:finalproject_front/pages/user/components/profile_career_select_button.dart';
import 'package:finalproject_front/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserProfileInsertPage extends StatefulWidget {
  const UserProfileInsertPage({super.key});

  @override
  State<UserProfileInsertPage> createState() => _UserProfileInsertPageState();
}

class _UserProfileInsertPageState extends State<UserProfileInsertPage> {
  late ScrollController scrollController; // ScrollerController은 non-null이다, late를 선언해 나중에 초기화.

  @override
  void initState() {
    super.initState();
    scrollController = new ScrollController();
  }

  final TextEditingController? _profileIntroduction = TextEditingController(text: "${profileList[0].introduction}");
  // DB에 저장되어 있는 값을 가져오는 역할.
  final TextEditingController? _profileRegion = TextEditingController(text: "${profileList[0].region}");

  final TextEditingController? _profileCertification = TextEditingController(text: "${profileList[0].certification}");

  final TextEditingController? _profileCareer = TextEditingController(text: "${profileList[0].carrerYear}");

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _buildAppbar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(gap_l),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProfileImage(context, profileList[0].filePath),
              SizedBox(height: gap_l),
              _buildProfileId(context, "green1234"),
              SizedBox(height: gap_l),
              CustomTextField(
                scrollAnimate,
                fieldTitle: "자기소개",
                hint: "간략한 자기소개를 작성해주세요.",
                lines: 6,
                fieldController: _profileIntroduction,
              ),
              SizedBox(height: gap_l),
              CustomTextField(scrollAnimate, fieldTitle: "지역을 작성해주세요.", hint: "예)부산,서울,경기도", lines: 1, fieldController: _profileRegion),
              SizedBox(height: gap_l),
              CustomTextField(scrollAnimate,
                  fieldTitle: "학력 전공을 작성해주세요", hint: "예)사이버 보안전공", lines: 1, subTitle: "선택사항", fieldController: _profileCertification),
              SizedBox(height: gap_l),
              ProfileCareerSeleteButton(),
              SizedBox(height: gap_l),
              CustomTextField(scrollAnimate, fieldTitle: "경력사항을 작성해주세요.", hint: "예)프리랜서1년", lines: 1, fieldController: _profileCareer),
              SizedBox(height: gap_l),
              CustomMainButton(buttonRoutePath: "/profileDetail", buttonText: "저장하기")
            ],
          ),
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

Widget _buildProfileImage(BuildContext context, String imagePath) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(150),
    child: Image.asset(
      "${imagePath}",
      width: 80,
      height: 80,
      fit: BoxFit.cover,
    ),
  );
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
            hintText: "${userId}",
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
