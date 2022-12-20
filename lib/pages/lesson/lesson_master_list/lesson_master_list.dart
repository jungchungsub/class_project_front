import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/dto/request/lesson_update_info.dart';
import 'package:finalproject_front/dummy_models/master_lesson_list_resp_dto.dart';
import 'package:finalproject_front/pages/lesson/lesson_master_list/model/lesson_master_list_model.dart';
import 'package:finalproject_front/pages/lesson/lesson_master_list/model/lesson_master_list_view_model.dart';
import 'package:finalproject_front/pages/lesson/lesson_update_page.dart';
import 'package:finalproject_front/size.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LessonMasterListPage extends ConsumerWidget {
  final userId;
  LessonMasterListPage({required this.userId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    LessonMasterListModel? model = ref.watch(lessonMasterListViewModel(userId));
    if (model == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Scaffold(
        appBar: _buildAppbar(context),
        body: ListView.builder(
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: ((BuildContext context, int index) {
              return _buildLessonExpertList(context, index, ref, model!);
            })));
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
          "클래스 리스트",
          style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

Widget _buildLessonExpertList(BuildContext context, int index, WidgetRef ref, LessonMasterListModel model) {
  return Container(
    child: Column(
      children: [
        SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xffF0F0F0), width: 3),
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
                              image: DecorationImage(
                                  image: NetworkImage(
                                    "https://picsum.photos/182",
                                  ),
                                  fit: BoxFit.cover),
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
                                "${model.sellingList.lessonDtoList[index].lessonName}",
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                "전문가 : ${model.sellingList.expertDto.expertName}",
                                style: TextStyle(fontSize: 12),
                              ),
                              Text(
                                "${model.sellingList.lessonDtoList[index].lessonPrice}원",
                                style: TextStyle(fontSize: 12),
                              ),
                              Text(
                                "마감일자 : ${model.sellingList.lessonDtoList[index].lessonDeadLine}",
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
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => LessonUpdatePage(model: ))); //아이디 넘겨줘야함
                        }),
                        child: Text(
                          "수정하기",
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
