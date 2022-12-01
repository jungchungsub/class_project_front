import 'package:extended_image/extended_image.dart';
import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/pages/lesson/lesson_detail/components/lesson_cancel.dart';
import 'package:finalproject_front/pages/lesson/lesson_detail/components/lesson_curriculam.dart';

import 'package:finalproject_front/pages/lesson/lesson_detail/components/lesson_evaluation.dart';

import 'package:finalproject_front/pages/lesson/lesson_detail/components/lesson_expert_information.dart';
import 'package:finalproject_front/pages/lesson/lesson_detail/components/lesson_place.dart';
import 'package:finalproject_front/pages/lesson/lesson_detail/components/lesson_possible_date.dart';
import 'package:finalproject_front/pages/lesson/lesson_detail/components/lesson_time.dart';
import 'package:finalproject_front/pages/lesson/lesson_detail/components/lessson_title.dart';

import 'package:finalproject_front/pages/lesson/lesson_detail/components/purchase_review.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LessonDetailPage extends StatelessWidget {
  const LessonDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      // layoutBuilder안에 넣는 이유는 해당디바이스 사이즈를 알기위해서 넣어준다.
      builder: (context, constrains) {
        Size _size = MediaQuery.of(context).size; //해당 디바이스의 사이즈를 가지고 온다.
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              //child같은 개념이지만 조금 다르다
              SliverAppBar(
                  leading: IconButton(
                      icon: Icon(
                        CupertinoIcons.back,
                        color: Colors.black,
                        size: 30,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  pinned: true,
                  expandedHeight: 200.0,
                  //이미지보여줄 가로세로 길이를 동일하게 해준다. //디바이스 가로 길이만큼 준다.
                  primary: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: SizedBox(
                      height: 30,
                      width: _size.width,
                      child: ExtendedImage.network(
                        "https://picsum.photos/250",
                        fit: BoxFit.cover,
                      ),
                    ),
                  )),
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                        child: Column(
                      children: [
                        LessonTitle(),
                        LessonCurriculam(),
                        LessonTime(),
                        LessonPlace(),
                        LessonPossibleDate(),
                        LessonCancel(),
                        LessonExpertInformation(),
                        LessonEvaluation(),
                        PurchaseReview(),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: gSubButtonColor, width: 2),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "문의",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                              ConstrainedBox(
                                constraints: BoxConstraints.tightFor(
                                    height: 50, width: 240),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                      backgroundColor: Color(0xff4880ED),
                                      minimumSize: Size(340, 50)),
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, "/orderDetail");
                                    //Form에서 현재의 상태 값이 null이 아니라면 /home로 push 해준다.
                                  },
                                  child: Text(
                                    "50,000원 결제하기",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: gSubButtonColor, width: 2),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:
                                      Center(child: Icon(CupertinoIcons.heart)),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 30),
                      ],
                    )),
                  ),
                ]),
              ),
              //container같은 보통위젯들은 바로 주지 못한다.
              //만약사용하고 싶다면 아래와 같이 SliverToBoxAdapter로 감싸준다.
              //SliverToBoxAdapter(child: Container()),
            ],
          ),
        );
      },
    );
  }
}
