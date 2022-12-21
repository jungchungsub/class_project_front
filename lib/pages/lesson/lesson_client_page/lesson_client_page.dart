import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/dummy_models/lesson_client_list_resp_dto.dart';
import 'package:finalproject_front/pages/lesson/lesson_client_page/model/lesson_client_model.dart';
import 'package:finalproject_front/pages/lesson/lesson_client_page/model/lesson_client_view_model.dart';
import 'package:finalproject_front/size.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LessonClientListPage extends ConsumerWidget {
  // const LessonClientListPage({Key? key}) : super(key: key);

  // @override
  // Widget build(BuildContext context, WidgetRef ref) {

  final userId;
  const LessonClientListPage({required this.userId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    LessonClientListModel? model = ref.watch(lessonClientListViewModel(userId));

    if (model == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return Scaffold(
      appBar: _buildAppbar(context),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: ((BuildContext context, int index) {
          return BuyList(itemIndex: index);
        }),
      ),
    );
  }

  AppBar _buildAppbar(context) {
    return AppBar(
      elevation: 1.0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          CupertinoIcons.back,
          color: Colors.black,
          size: 26,
        ),
      ),
      centerTitle: true,
      title: TextButton(
        onPressed: () {},
        child: Text(
          "구매한 클래스",
          style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class BuyList extends StatelessWidget {
  final int itemIndex;
  const BuyList({
    required this.itemIndex,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: gBorderColor, width: 3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    InkWell(
                      onTap: (() {
                        Navigator.pushNamed(context, "/lessonDetail");
                      }),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              height: 90,
                              width: 110,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(image: NetworkImage("${LessonClientList[itemIndex].lessonImage}"), fit: BoxFit.cover),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: gap_m,
                          ),
                          Container(
                            width: 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${LessonClientList[itemIndex].lessonTitle}",
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "전문가 : ${LessonClientList[itemIndex].masterName}",
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text(
                                  "${LessonClientList[itemIndex].lessonPrice}원",
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text(
                                  "마감일자 : ${LessonClientList[itemIndex].expiredDate}",
                                  style: TextStyle(fontSize: 12),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: gContentBoxColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: (() {
                            Navigator.pushNamed(context, "/reviewInsert");
                          }),
                          child: Text(
                            "리뷰 작성하기",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: gButtonOffColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
