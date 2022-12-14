import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/dummy_models/profile_detail_resp_dto.dart';
import 'package:finalproject_front/pages/components/custom_main_button.dart';
import 'package:finalproject_front/pages/user/user_profile_detail_page/model/user_profile_detail_page_model.dart';
import 'package:finalproject_front/pages/user/user_profile_detail_page/model/user_profile_detail_page_view_model.dart';
import 'package:finalproject_front/pages/user/user_profile_insert_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../../../size.dart';

class UserProfileDetailPage extends ConsumerWidget {
  final int id;
  UserProfileDetailPage({required this.id, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UserProfileDetailPageModel? model = ref.watch(userProfileDetailPageViewModel(id));
    Logger().d("디테일 페이지 유저 확인 : ${model?.profileRespDto.user.username}");
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody(context, model),
    );
  }

  Widget _buildBody(BuildContext context, UserProfileDetailPageModel? model) {
    if (model == null) {
      return Center(child: CircularProgressIndicator());
    }
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _buildProfileHeader(
              context,
              model.profileRespDto.user.username,
              // model.profileRespDto.filePath, // 나중에 사진 추가 시 해야함.
              profileList[0].filePath,
            ),
            SizedBox(height: 20),
            _buildProfileIntro(context, model.profileRespDto.introduction),
            SizedBox(height: 10),
            _buildProfileContent(context, "지역", model.profileRespDto.region),
            SizedBox(height: 10),
            _buildProfileContent(context, "학력전공", model.profileRespDto.career),
            SizedBox(height: 10),
            _buildProfileContent(context, "보유자격증", model.profileRespDto.certification),
            SizedBox(height: 10),
            _buildProfileContent(context, "경력기간", model.profileRespDto.careerYear),
            SizedBox(height: 20),
            // CustomMainButton(buttonRoutePath: "/profileInsert", buttonText: "프로필 등록/수정하기"
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfileInsertPage(model: model.profileRespDto)));
              },
              style: ElevatedButton.styleFrom(
                primary: gButtonOffColor,
                minimumSize: Size(getScreenWidth(context), 60),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "프로필 등록/수정하기",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context, String userName, String profileImagePath) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${userName}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(CupertinoIcons.star_fill, color: Colors.yellow, size: 16),
                    SizedBox(width: 10),
                    Text(
                      "4.5 | 25개의 평가",
                      style: TextStyle(color: gSubTextColor, fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(150),
            child: Image.asset(
              profileImagePath,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }

  AppBar _buildAppbar(BuildContext context) {
    return AppBar(
      elevation: 1,
      centerTitle: true,
      title: Text(
        "프로필",
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

Widget _buildProfileIntro(BuildContext context, String introContent) {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "소개",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 10),
        _buildUnderLine(),
        SizedBox(height: 10),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "${introContent}",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: gSubTextColor),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  );
}

Container _buildUnderLine() {
  return Container(
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(1),
    ),
    width: 30,
    height: 3,
  );
}

Widget _buildProfileContent(BuildContext context, String title, String content) {
  return Container(
    child: Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "${title}",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 5),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "${content}",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: gSubTextColor),
          ),
        ),
      ],
    ),
  );
}
