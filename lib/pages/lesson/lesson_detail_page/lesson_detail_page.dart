import 'package:extended_image/extended_image.dart';
import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/pages/lesson/lesson_detail_page/model/lesson_detail_page_model.dart';
import 'package:finalproject_front/pages/lesson/lesson_detail_page/model/lesson_detail_page_view_model.dart';
import 'package:finalproject_front/dummy_models/lesson_detail_resp_dto.dart';
import 'package:finalproject_front/pages/main/home/home_page/model/home_page_model.dart';
import 'package:finalproject_front/size.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LessonDetailPage extends ConsumerWidget {
  final int lessonId;

  const LessonDetailPage({required this.lessonId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final rc = ref.read(lessonController);

    return Scaffold(
      bottomSheet: _buildLessonBar(),
      body: CustomScrollView(
        slivers: [
          _buildSliverAppbar(context),
          SliverToBoxAdapter(
            child: Column(
              children: [
                _buildHeader(ref),
                _buildDivider(),
                _buildBody(ref),
                //build5(ref),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(WidgetRef ref) {
    LessonDetailPageModel? model = ref.watch(lessonDetailPageViewModel(lessonId));
    return (model == null
        ? SizedBox()
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 16),
                  child: Text(
                    "${model.lessonRespDto.lessonDto.lessonPrice}원",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                _buildLessonContentBox("커리큘럼", "${model.lessonRespDto.lessonDto.curriculum}", 120, 2),
                _buildLessonContentBox("레슨시간", "${model.lessonRespDto.lessonDto.lessonTime}", 55, 1),
                _buildLessonContentBox("레슨횟수", "${model.lessonRespDto.lessonDto.lessonCount}", 55, 1),
                _buildLessonContentBox("장소", "${model.lessonRespDto.lessonDto.lessonPlace}", 55, 1),
                _buildLessonPossibleDate("${model.lessonRespDto.lessonDto.possibleDays}"),
                _buildLessonContentBox("취소 및 환불규정", "${model.lessonRespDto.lessonDto.lessonPolicy}", 200, 6),
                _buildLessonExpertInformation("${model.lessonRespDto.profileDto.expertPhoto}", "전문가정보",
                    "${model.lessonRespDto.profileDto.expertName}", "${model.lessonRespDto.profileDto.expertIntroduction}"),
                _buildLessonEvaluation(
                    "${model.lessonRespDto.lessonAvgGrade}", model.lessonRespDto.lessonAvgGrade, "${model.lessonRespDto.lessonTotalReviewsCount}"),
                // Column(
                //   children: List.generate(
                //       model.lessonRespDto.lessonReviewList.length,
                //       (index) => _buildReview(
                //           model.lessonRespDto.lessonReviewList[index].username, model.lessonRespDto.lessonReviewList[index].reviewContent)),
                // ),
                Column(
                  children: model.lessonRespDto.lessonReviewList.map((e) => _buildReview(e.username, e.reviewContent, e.lessonGrade)).toList(),
                ),
                SizedBox(
                  height: gap_xxl,
                ),
              ],
            )),
          ));
  }

  Widget _buildHeader(WidgetRef ref) {
    LessonDetailPageModel? model = ref.watch(lessonDetailPageViewModel(lessonId));
    return model == null
        ? SizedBox()
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                _buildLessonTitle("${model.lessonRespDto.lessonDto.lessonName}", "${model.lessonRespDto.lessonTotalReviewsCount}",
                    model.lessonRespDto.lessonAvgGrade),
              ],
            ));
  }
}

Padding _buildLessonPrice(int lessonPrice) {
  return Padding(
    padding: const EdgeInsets.only(top: 16, bottom: 16),
    child: Text(
      "${lessonPrice}원",
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
  );
}

Container _buildLessonEvaluation(String evaluation, double star, String totalReview) {
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
                    RatingBarIndicator(
                      rating: star,
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 18.0,
                      direction: Axis.horizontal,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${totalReview}개의 평가",
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: gSubTextColor),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Row(
                    //   children: [
                    //     _buildStar(CupertinoIcons.star_fill),
                    //     SizedBox(width: 5),
                    //     _buildStar(CupertinoIcons.star_fill),
                    //     SizedBox(width: 5),
                    //     _buildStar(CupertinoIcons.star_fill),
                    //     SizedBox(width: 5),
                    //     _buildStar(CupertinoIcons.star_fill),
                    //     SizedBox(width: 5),
                    //     _buildStar(CupertinoIcons.star_fill),
                    //   ],
                    // ),
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

Widget _buildReview(String username, String reviewContent, double lessonGrade) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              image: DecorationImage(image: NetworkImage("https://picsum.photos/200"), fit: BoxFit.cover),
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${username}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              RatingBarIndicator(
                rating: lessonGrade,
                itemBuilder: (context, index) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: 14.0,
                direction: Axis.horizontal,
              ),
              // Row(
              //   children: [
              //     _buildStar(CupertinoIcons.star_fill),
              //     SizedBox(width: 5),
              //     _buildStar(CupertinoIcons.star_fill),
              //     SizedBox(width: 5),
              //     _buildStar(CupertinoIcons.star_fill),
              //     SizedBox(width: 5),
              //     _buildStar(CupertinoIcons.star_fill),
              //     SizedBox(width: 5),
              //     _buildStar(CupertinoIcons.star_fill),
              //   ],
              // ),
            ],
          )
        ],
      ),
      SizedBox(height: gap_m),
      Text("${reviewContent}", style: TextStyle(fontSize: 16)),
      SizedBox(height: gap_xl),
    ],
  );
}

Icon _buildStar(IconData mIcon) {
  return Icon(
    mIcon,
    color: Colors.yellow,
    size: 14,
  );
}

Container _buildLessonExpertInformation(String image, String title, String name, String content) {
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
                            image: NetworkImage(
                              "https://picsum.photos/251",
                            ),
                            fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${name}",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 16, right: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "${content}",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
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

Container _buildLessonPossibleDate(String possibleDays) {
  String possibleDays1 = "${possibleDays}";
  String result = possibleDays1.substring(1, possibleDays1.indexOf(']'));
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
              child: Text(
                "${result}",
                style: TextStyle(
                  fontSize: 16,
                ),
              )),
        ),
        SizedBox(
          height: 20,
        )
      ],
    ),
  );
}

Container _buildLessonContentBox(String title, String content, double heig, int max) {
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

Container _buildLessonBox(String title, int content, double heig, int max) {
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

Container _buildLessonTitle(String lessonTitle, String totalReview, double lessonGrade) {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30),
        Text(
          "${lessonTitle}",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 15),
          child: Row(
            children: [
              RatingBarIndicator(
                rating: lessonGrade,
                itemBuilder: (context, index) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: 20.0,
                direction: Axis.horizontal,
              ),
              SizedBox(width: gap_s),
              Text("평가 ${totalReview}개", style: TextStyle(color: gSubTextColor, fontWeight: FontWeight.bold, fontSize: 14))
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
    color: gDivider,
  );
}

SliverAppBar _buildSliverAppbar(BuildContext context) {
  Size _size = MediaQuery.of(context).size;
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

class _buildLessonBar extends StatefulWidget {
  const _buildLessonBar({Key? key}) : super(key: key);

  @override
  State<_buildLessonBar> createState() => _buildLessonBarState();
}

class _buildLessonBarState extends State<_buildLessonBar> {
  bool click = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(height: 50, width: 270),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xff4880ED),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "/orderDetail");
                  //Form에서 현재의 상태 값이 null이 아니라면 /home로 push 해준다.
                },
                child: Text(
                  "구매",
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Colors.grey,
                    width: 2,
                  )),
              child: Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  onPressed: () {
                    setState(() {
                      click = !click;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 6, bottom: 12),
                    child: Icon(
                      (click == false) ? CupertinoIcons.heart : CupertinoIcons.heart_fill,
                      color: Colors.red,
                      size: 40,
                    ),
                  ),
                ),
              ),
              // child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: (subcribeCheck == true)
              //         ? Center(
              //             child: Icon(
              //             CupertinoIcons.heart,
              //           ))
              //         : Center(
              //             child: Icon(
              //             CupertinoIcons.heart_fill,
              //             color: Colors.red,
              //           ))

              //     ),
            )
          ],
        ),
      ),
    );
  }
}
