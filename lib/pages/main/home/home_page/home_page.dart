import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/controller/lesson_controller.dart';
import 'package:finalproject_front/dummy_models/lesson_detail_resp_dto.dart';
import 'package:finalproject_front/pages/lesson/lesson_detail_page/lesson_detail_page.dart';
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
    LessonController controllerCT = ref.read(lessonController);

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
                        _buildCategory(),
                      ],
                    ),
                  ),
                ),
                _buildDivider()
              ]))
            ];
          },
          body: _buildClassList(context, "/lessonDetail", controllerCT)),
    );
  }

  Widget _buildClassList(BuildContext context, String routePath, LessonController lessonCT) {
    return Consumer(
      builder: ((context, ref, child) {
        HomePageModel? model = ref.watch(homePageViewModel);
        return InkWell(
            onTap: () {
              lessonCT.moveDetailPage(1);
              Navigator.pushNamed(context, "${routePath}");
              Logger().d("실행?>");

              // Navigator.push(context, MaterialPageRoute(builder: ((context) => (LessonDetailPage(state)))));
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 10, //가로 item간의 간격을 지정한다.
                    crossAxisCount: 2, //한행에 보여줄 갯수
                    mainAxisSpacing: 10, //세로아이템의 간격을 지정한다.
                  ),
                  itemCount: 10, //총 item의 갯수
                  itemBuilder: (context, index) {
                    return //lessonDetail(itemIndex: index);

                        Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        children: [
                          Container(
                            height: 90,
                            width: 160,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(image: NetworkImage("${model}"), fit: BoxFit.cover),
                            ),
                          ),
                          SizedBox(height: gap_m),
                          // Text(
                          //   "${model?.lessonLatestList[index].lessonPhoto}",
                          //   style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                          //   maxLines: 2,
                          //   overflow: TextOverflow.ellipsis,
                          // ),
                          Row(
                            children: [
                              Icon(CupertinoIcons.heart_fill, color: Colors.red, size: 15),
                              SizedBox(width: gap_m),
                              Text(
                                "${model?.lessonLatestList[index].avgGrade} |  ${model?.lessonLatestList[index].totalReview} 개의 평가",
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
                    );
                  }),
            ));
      }),
    );
  }

  Divider _buildDivider() {
    return Divider(
      color: gBorderColor,
      thickness: 1.0,
    );
  }

  Row _buildCategory() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CategorySelect(image: "assets/sports.png", text: "뷰티・운동", path: "/categoryDetail"),
        CategorySelect(image: "assets/Headphones.png", text: "댄스・뮤직", path: "/categoryDetail"),
        CategorySelect(image: "assets/art.png", text: "미술・문학", path: "/categoryDetail"),
        CategorySelect(image: "assets/Search.png", text: "공예・기타", path: "/categoryDetail"),
      ],
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
//               image: DecorationImage(image: NetworkImage("${model}"), fit: BoxFit.cover),
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
