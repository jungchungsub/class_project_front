import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/controller/category_controller.dart';
import 'package:finalproject_front/controller/lesson_controller.dart';
import 'package:finalproject_front/pages/main/home/components/category_select.dart';
import 'package:finalproject_front/pages/main/home/home_page/model/home_page_model.dart';
import 'package:finalproject_front/pages/main/home/home_page/model/home_page_view_model.dart';
import 'package:finalproject_front/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class HomePage extends ConsumerWidget {
  HomePage({Key? key}) : super(key: key);
  final ScaffoldKey = GlobalKey<ScaffoldState>();
  final refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    LessonController lessonCT = ref.read(lessonController);
    HomePageModel? model = ref.watch(homePageViewModel);
    CategoryController categoryCT = ref.read(categorryController);

    Logger().d("homePage 실행");
    return Scaffold(
      appBar: _buildAppBar(context, "/searchMain"),
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverList(
                  delegate: SliverChildListDelegate([
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        _buildMainImage(),
                        SizedBox(height: gap_l),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildCategory11("assets/beauty.png", "뷰티", categoryCT),
                                _buildCategory11("assets/sports.png", "운동", categoryCT),
                                _buildCategory11("assets/Headphones.png", "댄스", categoryCT),
                                _buildCategory11("assets/Microphone.png", "뮤직", categoryCT),
                              ],
                            ),
                            SizedBox(height: gap_l),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildCategory11("assets/paint.png", "미술", categoryCT),
                                _buildCategory11("assets/read.png", "문학", categoryCT),
                                _buildCategory11("assets/art.png", "공예", categoryCT),
                                _buildCategory11("assets/Search.png", "기타", categoryCT),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                _buildDivider()
              ]))
            ];
          },
          body: _buildClassList(context, "/lessonDetail", lessonCT, model)),
    );
  }

  Widget _buildCategory11(String image, String text, CategoryController categoryCT) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            //lessonCT.moveDetailPage(lessonId: model.lessonLatestList[index].lessonId);
          },
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xffF9F9F9),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      "${image}",
                      fit: BoxFit.cover,
                      height: 40,
                      width: 40,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10),
        Text("${text}")
      ],
    );
  }

  Widget _buildClassList(
    BuildContext context,
    String routePath,
    LessonController lessonCT,
    HomePageModel? model,
  ) {
    if (model == null) {
      return Center(child: CircularProgressIndicator());
    }
    return Consumer(builder: ((context, ref, child) {
      return Padding(
        padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 10, //가로 item간의 간격을 지정한다.
              crossAxisCount: 2, //한행에 보여줄 갯수
              mainAxisSpacing: 10, //세로아이템의 간격을 지정한다.
            ),
            itemCount: 10, //총 item의 갯수
            itemBuilder: (context, int index) {
              return InkWell(
                onTap: () {
                  lessonCT.moveDetailPage(lessonId: model.lessonLatestList[index].lessonId);
                  // Navigator.pushNamed(context, "${routePath}");
                  Logger().d("실행onTop");
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 90,
                        width: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(image: NetworkImage("https://picsum.photos/200"), fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(height: gap_m),
                      Text(
                        "${model?.lessonLatestList[index].lessonName}",
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        children: [
                          Icon(CupertinoIcons.heart_fill, color: Colors.red, size: 15),
                          SizedBox(width: gap_m),
                          Text(
                            "${model?.lessonLatestList[index].avgGrade} | ${model?.lessonLatestList[index].totalReview} 개의 평가",
                            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "${model?.lessonLatestList[index].lessonPrice}원",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
      );
    }));
  }

  Divider _buildDivider() {
    return Divider(
      height: 1,
      thickness: 1.0,
    );
  }

  ClipRRect _buildMainImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.asset(
        "assets/home1.jpg",
        fit: BoxFit.cover,
        height: 100,
        width: 400,
      ),
    );
  }

  AppBar _buildAppBar(context, routePath) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1.0,
      actions: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: OutlinedButton(
            onPressed: () {
              Navigator.pushNamed(context, "${routePath}");
            },
            child: Row(
              children: [
                Icon(
                  CupertinoIcons.search,
                  color: Colors.black,
                ),
                SizedBox(
                  width: gap_s,
                ),
                Text(
                  "Search....",
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
            style: OutlinedButton.styleFrom(
                maximumSize: Size(160, 40),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                )),
          ),
        ),
        SizedBox(
          width: gap_m,
        ),
        Icon(
          CupertinoIcons.bell,
          color: Colors.black,
          size: 26,
        ),
        SizedBox(
          width: gap_m,
        ),
      ],
    );
  }
}

// class lessonDetail extends StatelessWidget {
//   final int itemIndex;
//   const lessonDetail({
//     required this.itemIndex,
//     Key? key,
//   }) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 10, right: 10),
//       child: Column(
//         children: [
//           Container(
//             height: 90,
//             width: 160,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               image: DecorationImage(image: NetworkImage("https://picsum.photos/200"), fit: BoxFit.cover),
//             ),
//           ),
//           SizedBox(height: gap_m),
//           Text(
//             lessonList[itemIndex].lessonName,
//             style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
//             maxLines: 2,
//             overflow: TextOverflow.ellipsis,
//           ),
//           Row(
//             children: [
//               Icon(CupertinoIcons.heart_fill, color: Colors.red, size: 15),
//               SizedBox(width: gap_m),
//               Text(
//                 "${lessonList[itemIndex].reviewDtoList[0].lessonGrade} | ${lessonList[itemIndex].totalReview} 개의 평가",
//                 style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
//               ),
//             ],
//           ),
//           Row(
//             children: [
//               Text(
//                 "${lessonList[itemIndex].lessonPrice}원",
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// Padding(
//                       padding: const EdgeInsets.only(left: 10, right: 10),
//                       child: Column(
//                         children: [
//                           Container(
//                             height: 90,
//                             width: 160,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               image: DecorationImage(image: NetworkImage("${model}"), fit: BoxFit.cover),
//                             ),
//                           ),
//                           SizedBox(height: gap_m),
//                           // Text(
//                           //   "${model?.lessonLatestList[index].lessonPhoto}",
//                           //   style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
//                           //   maxLines: 2,
//                           //   overflow: TextOverflow.ellipsis,
//                           // ),
//                           Row(
//                             children: [
//                               Icon(CupertinoIcons.heart_fill, color: Colors.red, size: 15),
//                               SizedBox(width: gap_m),
//                               Text(
//                                 "${model?.lessonLatestList[index].avgGrade} |  ${model?.lessonLatestList[index].totalReview} 개의 평가",
//                                 style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
//                               ),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               Text(
//                                 "${model?.lessonLatestList[index].lessonPrice}원",
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     )