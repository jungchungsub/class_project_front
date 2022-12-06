import 'package:extended_image/extended_image.dart';
import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/models/lesson.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LessonDetailPage extends StatelessWidget {
  final Lesson lesson;
  const LessonDetailPage({required this.lesson, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      // layoutBuilder안에 넣는 이유는 해당디바이스 사이즈를 알기위해서 넣어준다.
      builder: (context, constrains) {
        Size _size = MediaQuery.of(context).size; //해당 디바이스의 사이즈를 가지고 온다.
        return Scaffold(
          bottomSheet: _buildLessonBottomBar(context),
          body: CustomScrollView(
            slivers: [
              //child같은 개념이지만 조금 다르다
              _buildSliverAppbar(context, _size),
              SliverList(
                delegate: SliverChildListDelegate([
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Container(
                            child: Column(
                          children: [
                            _buildLessonTitle(lesson.lessonTitle,
                                "내 몸 상태 바로 알기 내몸에 꼭 맞는 운동", 16)
                          ],
                        )),
                      ),
                      _buildDivider(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildLessonPrice("50,000"),
                            _buildLessonContentBox(
                                "커리큘럼", "간단한 서비스 설명", 120, 2),
                            _buildLessonContentBox("레슨시간", "108분", 55, 1),
                            _buildLessonContentBox("레슨횟수", "10회", 55, 1),
                            _buildLessonContentBox(
                                "장소", "부산광역시 부산진구 홍길동", 55, 1),
                            _buildLessonPossibleDate(),
                            _buildLessonContentBox(
                                "취소 및 환불규정",
                                "취소 및 환불을 하면 솰라솰라 10회 피티 이용제한이 생기면서 한국 중국 러시아 일본 베트남 말레시아 영국 미국 북한 필리핀 브라질",
                                200,
                                6),
                            _buildLessonExpertInformation("전문가 정보", "김동진",
                                "한국대학교 경호학과 졸업, 다수 대회에서 수상경력 있습니다."),
                            _buildLessonEvaluation(4.6, 124),
                            _buildPurchaseReview(),
                          ],
                        )),
                      ),
                    ],
                  ),
                ]),
              ),
              //container같은 보통위젯들은 바로 주지 못한다.
              //만약사용하고 싶다면 아래와 같이 SliverToBoxAdapter로 감싸준다.
            ],
          ),
        );
      },
    );
  }

  Padding _buildLessonPrice(String lessonPrice) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 16),
      child: Text(
        "${lessonPrice}원",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Container _buildLessonBottomBar(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(height: 50, width: 300),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xff4880ED),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "/orderDetail");
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
                border: Border.all(color: gSubButtonColor, width: 2),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Icon(
                  CupertinoIcons.heart,
                )),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _buildPurchaseReview() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          _buildReview(),
          _buildReview(),
          _buildReview(),
          _buildReview(),
          SizedBox(
            height: 60,
          ),
        ],
      ),
    );
  }

  Container _buildLessonEvaluation(double evaluation, int totalReview) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "받은평가",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xffEAF2FD),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Row(
                children: [
                  Text(
                    "${evaluation}",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          _buildStar(CupertinoIcons.star_fill),
                          SizedBox(width: 5),
                          _buildStar(CupertinoIcons.star_fill),
                          SizedBox(width: 5),
                          _buildStar(CupertinoIcons.star_fill),
                          SizedBox(width: 5),
                          _buildStar(CupertinoIcons.star_fill),
                          SizedBox(width: 5),
                          _buildStar(CupertinoIcons.star_fill),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${totalReview}개의 평가",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: gSubTextColor),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  Container _buildReview() {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(
                      image: NetworkImage("https://picsum.photos/200"),
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "제갈택",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      _buildStar(CupertinoIcons.star_fill),
                      SizedBox(width: 5),
                      _buildStar(CupertinoIcons.star_fill),
                      SizedBox(width: 5),
                      _buildStar(CupertinoIcons.star_fill),
                      SizedBox(width: 5),
                      _buildStar(CupertinoIcons.star_fill),
                      SizedBox(width: 5),
                      _buildStar(CupertinoIcons.star_fill),
                    ],
                  ),
                ],
              )
            ],
          ),
          Text("대박 한거랑 안한거랑 자신감 차이 머야! 평소에 자연스럽게 못해서 아쉬웠는데 방법 진짜 알려줘요",
              style: TextStyle(fontSize: 16)),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }

  Icon _buildStar(IconData mIcon) {
    return Icon(
      mIcon,
      color: Colors.yellow,
      size: 14,
    );
  }

  Container _buildLessonExpertInformation(
      String title, String name, String content) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${title}",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xffEAF2FD),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(
                              image: NetworkImage("https://picsum.photos/200"),
                              fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${name}",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16, bottom: 16, right: 16),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "${content}",
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.normal),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  Container _buildLessonPossibleDate() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "가능일",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xffEAF2FD),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                children: [
                  _buildDate(text: "월요일 : 18:00 ~ 23:00"),
                  _buildDate(text: "화요일 : 18:00 ~ 23:00"),
                  _buildDate(text: "수요일 : 18:00 ~ 23:00"),
                  _buildDate(text: "목요일 : 18:00 ~ 23:00"),
                  _buildDate(text: "금요일 : 18:00 ~ 23:00"),
                  _buildDate(text: "토요일 : 18:00 ~ 23:00"),
                  _buildDate(text: "일요일 : 18:00 ~ 23:00"),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  Container _buildLessonTime() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "수강시간",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: const Color(0xffEAF2FD),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "1회당 레슨시간(분)",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "105분",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "레슨 횟수",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "10회",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  Container _buildLessonContentBox(
      String title, String content, double heig, int max) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${title}",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Container(
            height: heig,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xffEAF2FD),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Text(
                "${content}",
                style: TextStyle(
                  fontSize: 16,
                ),
                maxLines: max,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  Container _buildLessonTitle(
      String lessonCategory, String lessonTitle, int lessonReview) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          Text(
            "${lessonCategory}",
            style: TextStyle(
                color: gSubTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 14),
          ),
          Text(
            "${lessonTitle}",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            child: Row(
              children: [
                Container(
                  child: Row(
                    children: [
                      Icon(
                        CupertinoIcons.star_fill,
                        color: Colors.yellow,
                        size: 18,
                      ),
                      Icon(
                        CupertinoIcons.star_fill,
                        color: Colors.yellow,
                        size: 18,
                      ),
                      Icon(
                        CupertinoIcons.star_fill,
                        color: Colors.yellow,
                        size: 18,
                      ),
                      Icon(
                        CupertinoIcons.star_fill,
                        color: Colors.yellow,
                        size: 18,
                      ),
                      Icon(
                        CupertinoIcons.star_fill,
                        color: Colors.yellow,
                        size: 18,
                      ),
                    ],
                  ),
                ),
                Text(
                  "평가 ${lessonReview}개",
                  style: TextStyle(
                      color: gSubTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Divider _buildDivider() {
    return Divider(
      thickness: 1,
      height: 0,
      color: gBorderColor,
    );
  }

  SliverAppBar _buildSliverAppbar(BuildContext context, Size _size) {
    return SliverAppBar(
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
        ));
  }
}

class _buildDate extends StatelessWidget {
  final String text;
  const _buildDate({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "${text}",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
