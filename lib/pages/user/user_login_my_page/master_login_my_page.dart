import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/controller/user_controller.dart';
import 'package:finalproject_front/domain/user_session.dart';
import 'package:finalproject_front/pages/user/components/service_text.dart';
import 'package:finalproject_front/pages/user/user_login_my_page/master_model/master_my_page_model.dart';
import 'package:finalproject_front/pages/user/user_login_my_page/master_model/master_my_page_view_model.dart';
import 'package:finalproject_front/pages/user/user_update_page/user_update_page.dart';
import 'package:finalproject_front/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../components/bottom_image_box.dart';

class MasterLoginMyPage extends ConsumerWidget {
  const MasterLoginMyPage({Key? key}) : super(key: key);
  static const String defaultProfile = "assets/defaultProfile.jpeg";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MasterMyPageModel? model = ref.watch(masterMyPageViewModel);

    final userCT = ref.read(userController);

    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context, model, userCT),
    );
  }

  Widget _buildBody(BuildContext context, MasterMyPageModel? model, UserController userCT) {
    Logger().d("전문가 실행");
    // 유저 이미지 가져오는데 잠깐 시간이 필요
    if (model == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildUserProfile(
                  context: context,
                  role: UserSession.user.role,
                  username: model.masterPageRespDto.username,
                  changeRole: "일반회원",
                  profileImagePath: model.masterPageRespDto.profilePhoto!,
                  userCT: userCT,
                  id: UserSession.user.id!,
                  defaultProfile: defaultProfile,
                ),
                SizedBox(height: gap_l),
                Text(
                  "나의 서비스",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: gap_m),
                ServiceText(routePath: "/customerService", serviceText: "고객센터"),
                SizedBox(height: gap_m),
                ServiceText(routePath: "/lessonInsert", serviceText: "레슨 등록 하기"),
                SizedBox(height: gap_m),
                ServiceText(routePath: "/paymentSalesDetail", serviceText: "판매내역"),
                SizedBox(height: gap_m),
                ServiceText(routePath: "/lessonExpertList", serviceText: "등록한 레슨 보기"),
                SizedBox(height: gap_xxl),
                BottomImageBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 1.0,
      leading: IconButton(
        onPressed: () {},
        icon: Icon(
          CupertinoIcons.bell,
          color: Colors.black,
          size: 26,
        ),
      ),
      centerTitle: true,
      title: TextButton(
        onPressed: () {},
        child: Text(
          "로고",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 15, right: 20),
          child: InkWell(
            onTap: () {
              // Navigator.pushNamed(context, "/userUpdate");

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UserUpdatePage(
                            userInfo: UserSession.user,
                          )));
            },
            child: Text(
              "계정 설정",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Widget _buildUserProfile(
    {required BuildContext context,
    required String role,
    required String username,
    required String changeRole,
    required String profileImagePath,
    required UserController userCT,
    required int id,
    required String defaultProfile}) {
  return Row(
    children: [
      InkWell(
          onTap: () {
            userCT.moveProfileInsertOrDetailPage(
              id: id,
              username: username,
            );
          },
          child: profileImagePath == ''
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(150),
                  child: Image.asset(
                    defaultProfile,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(150),
                  child: Image.asset(
                    profileImagePath,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                )),
      SizedBox(width: gap_l),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 20,
            decoration: BoxDecoration(
              color: gClientColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Text(
                role,
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            username,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          InkWell(
            onTap: () {
              // 전문가로 전환, 의뢰인으로전환
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: gBorderColor),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 5.0),
                child: Row(
                  children: [
                    Icon(
                      CupertinoIcons.person_2,
                      size: 18,
                      color: gPrimaryColor,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "$changeRole으로 전환",
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      )
    ],
  );
}
