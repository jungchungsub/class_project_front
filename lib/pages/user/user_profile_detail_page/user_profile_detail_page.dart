import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/pages/user/user_profile_detail_page/model/user_profile_detail_page_model.dart';
import 'package:finalproject_front/pages/user/user_profile_detail_page/model/user_profile_detail_page_view_model.dart';
import 'package:finalproject_front/pages/user/user_profile_update_page/user_profile_update_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../../../dto/request/profile_update_info.dart';
import '../../../size.dart';

class UserProfileDetailPage extends ConsumerWidget {
  final int id;
  final String defaultProfile = "assets/defaultProfile.jpeg";
  final String username;

  UserProfileDetailPage({required this.id, super.key, required this.username});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UserProfileDetailPageModel? model = ref.watch(userProfileDetailPageViewModel(id));
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
              model.profileRespDto.filePath,
              //profileList[0].filePath,
            ),
            SizedBox(height: 20),
            _buildProfileIntro(context, model.profileRespDto.introduction),
            SizedBox(height: 20),
            _buildProfileContent(context, "지역", model.profileRespDto.region),
            SizedBox(height: 20),
            _buildProfileContent(context, "학력전공", model.profileRespDto.career),
            SizedBox(height: 20),
            _buildProfileContent(context, "보유자격증", model.profileRespDto.certification),
            SizedBox(height: 20),
            _buildProfileContent(context, "경력기간", model.profileRespDto.careerYear),
            SizedBox(height: 20),
            _buildProfileUpdateButton(context, model)
          ],
        ),
      ),
    );
  }

  Widget _buildProfileUpdateButton(BuildContext context, UserProfileDetailPageModel model) {
    return ElevatedButton(
      onPressed: () {
        Logger().d("디테일 페이지 확인${model.profileRespDto.region} ");
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => UserProfileUpdatePage(
                        model: ProfileUpdateInfo(
                      id: id,
                      username: username,
                      filePath: model.profileRespDto.filePath!,
                      introduction: model.profileRespDto.introduction!,
                      region: model.profileRespDto.region!,
                      certification: model.profileRespDto.certification!,
                      careerYear: model.profileRespDto.careerYear!,
                      career: model.profileRespDto.career!,
                    ))));
      },
      style: ElevatedButton.styleFrom(
        primary: gButtonOffColor,
        minimumSize: Size(getScreenWidth(context), 60),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          "프로필 수정하기",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context, String? userName, String? profileImagePath) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
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
        profileImagePath == ''
            ? Flexible(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(150),
                  child: Image.asset(
                    defaultProfile,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
              )
            : Flexible(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(150),
                  child: Image.asset(
                    profileImagePath!,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
              )
      ],
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

Widget _buildProfileIntro(BuildContext context, String? introContent) {
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

Widget _buildProfileContent(BuildContext context, String title, String? content) {
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
