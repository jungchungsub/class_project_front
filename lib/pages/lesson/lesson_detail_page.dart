import 'package:extended_image/extended_image.dart';
import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/size.dart';

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
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: _buildLessonTitle(
                            "뷰티・운동", "내 몸 상태 바로 알기 내 몸에 꼭 맞는 운동", 16),
                      ),
                      _buildDivider(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 16, bottom: 16),
                              child: Text(
                                "120,000원",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            _buildLessonContentBox(
                                "커리큘럼", "간단한 서비스 설명", 120, 2),
                            SizedBox(height: gap_l),
                            _buildLessonContentBox("레슨시간", "108분", 55, 1),
                            SizedBox(height: gap_l),
                            _buildLessonContentBox("레슨횟수", "10회", 55, 1),
                            SizedBox(height: gap_l),
                            _buildLessonContentBox(
                                "장소", "부산광역시 부산진구 홍길동", 55, 1),
                            SizedBox(height: gap_l),
                            _buildLessonPossibleDate(),
                            SizedBox(height: gap_l),
                            _buildLessonContentBox(
                                "취소 및 환불규정",
                                "취소 및 환불을 하면 솰라솰라 10회 피티 이용제한이 생기면서 한국 중국 러시아 일본 베트남 말레시아 영국 미국 북한 필리핀 브라질",
                                200,
                                6),
                            SizedBox(height: gap_l),
                            _buildLessonExpertInformation("전문가 정보", "김동진",
                                "한국대학교 경호학과 졸업, 다수 대회에서 수상경력 있습니다."),
                            SizedBox(height: gap_l),
                            _buildLessonEvaluation(4.7, 124),
                            SizedBox(height: gap_l),
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
              SliverToBoxAdapter(child: Container()),
            ],
          ),
        );
      },
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
          Text(
            "구매후기 62개",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: gap_l,
          ),
          _buildReview("이현성", "https://picsum.photos/206",
              "대박 한거랑 안한거랑 자신감 차이 머야! 평소에 자연스럽게 못해서 아쉬웠는데 진짜 잘알려줘요"),
          _buildReview("아따맘마", "https://picsum.photos/201",
              "대박 한거랑 안한거랑 자신감 차이 머야! 평소에 자연스럽게 못해서 아쉬웠는데 진짜 잘알려줘요"),
          _buildReview("아이유", "https://picsum.photos/204",
              "대박 한거랑 안한거랑 자신감 차이 머야! 평소에 자연스럽게 못해서 아쉬웠는데 진짜 잘알려줘요"),
          _buildReview("드록바", "https://picsum.photos/203",
              "대박 한거랑 안한거랑 자신감 차이 머야! 평소에 자연스럽게 못해서 아쉬웠는데 진짜 잘알려줘요"),
          SizedBox(
            height: gap_xxl,
          ),
        ],
      ),
    );
  }

  Container _buildLessonEvaluation(double evaluation, int totalEvaluation) {
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
                  SizedBox(width: gap_l),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          _buildStar(CupertinoIcons.star_fill),
                          SizedBox(width: gap_s),
                          _buildStar(CupertinoIcons.star_fill),
                          SizedBox(width: gap_s),
                          _buildStar(CupertinoIcons.star_fill),
                          SizedBox(width: gap_s),
                          _buildStar(CupertinoIcons.star_fill),
                          SizedBox(width: gap_s),
                          _buildStar(CupertinoIcons.star_fill),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "$totalEvaluation개의 평가",
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
        ],
      ),
    );
  }

  Container _buildReview(
      String reviewName, String imagePath, String reviewContent) {
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
                      image: NetworkImage("${imagePath}"), fit: BoxFit.cover),
                ),
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${reviewName}",
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
          Text("${reviewContent}", style: TextStyle(fontSize: 16)),
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
          SizedBox(height: gap_m),
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
        ],
      ),
    );
  }

  Container _buildLessonTitle(
      String lessonCategory, String lessonContent, int contentReview) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: gap_xl),
          Text(
            "${lessonCategory}",
            style: TextStyle(
                color: gSubTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 14),
          ),
          Text(
            "${lessonContent}",
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
                SizedBox(width: gap_m),
                Text(
                  "평가 $contentReview개",
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
