import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/dummy_models/lesson_category_list_resp_dto.dart';
import 'package:finalproject_front/pages/category/components/category_page_model.dart';
import 'package:finalproject_front/pages/category/components/category_page_view_model.dart';
import 'package:finalproject_front/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryDetailPage extends ConsumerStatefulWidget {
  const CategoryDetailPage({required this.categoryId, Key? key}) : super(key: key);
  final int categoryId;
  @override
  ConsumerState<CategoryDetailPage> createState() => _CategoryDetailPageState();
}

class _CategoryDetailPageState extends ConsumerState<CategoryDetailPage> {
  @override
  Widget build(BuildContext context) {
    CategoryPageModel? model = ref.watch(categoryPageViewModel(widget.categoryId));

    return Scaffold(
        appBar: _buildAppbar(context),
        body: ListView(
          children: [
            _buildHeaderCategory(),
            Image.asset(
              "assets/home1.jpg",
              fit: BoxFit.cover,
              height: 120,
            ),
            _buildCategoryFilter("초기화", "인기순", 100, "예산"),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: ((BuildContext context, int index) {
                  return _buildCateogryList(context, ref, index, model);
                })),
          ],
        ));
  }

  Padding _buildCateogryList(BuildContext context, WidgetRef ref, int index, CategoryPageModel? model) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, right: 10, bottom: 8, left: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8, left: 8, top: 4),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                height: 90,
                width: 110,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(image: NetworkImage(lessonCategoryList[index].lessonDto.lessonImage), fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 220,
                    height: 50,
                    child: Text(
                      "${model?.categoryList[index].lessonName}",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "${model?.categoryList[index].avgGrade}",
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(width: gap_s),
                      Icon(
                        CupertinoIcons.star_fill,
                        color: Colors.yellow,
                        size: 16,
                      ),
                      SizedBox(
                        width: gap_s,
                      ),
                      Text(
                        "| ${model?.categoryList[index].totalReviews}개의 평가",
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "${lessonCategoryList[index].lessonDto.lessonPrice}",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        CupertinoIcons.heart_fill,
                        color: Colors.red,
                        size: 14,
                      ),
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

  Container _buildCategoryFilter(String reset, String budget, int total, String filterText) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 10, right: 10),
            child: Row(
              children: [
                OutlinedButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(
                        CupertinoIcons.arrow_2_circlepath,
                        color: Colors.black,
                        size: 16,
                      ),
                      SizedBox(
                        width: gap_s,
                      ),
                      Text(
                        "${reset}",
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ],
                  ),
                  style: OutlinedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  )),
                ),
                SizedBox(width: gap_l),
                _buildMiddleFilterList("${budget}"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    "총 ${total}건",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(
                        CupertinoIcons.arrow_up_arrow_down,
                        color: Colors.black,
                        size: 14,
                      ),
                      Text(
                        "${filterText}",
                        style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  OutlinedButton _buildMiddleFilterList(String text) {
    return OutlinedButton(
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    textColor: gPrimaryColor,
                    title: Text('1만 원 미만'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text('1~5만 원 이하'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text('5~10만원 이하'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text('10~15만원 이하'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text('15~20만원 이하'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text('20만원 이상'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
              ;
            });
      },
      child: Row(
        children: [
          Text(
            "${text}",
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
        ],
      ),
      style: OutlinedButton.styleFrom(
          shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      )),
    );
  }

  Widget _buildHeaderCategory() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "전체",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: gap_l),
              Text(
                "뷰티",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: gSubButtonColor),
              ),
              SizedBox(width: gap_l),
              Text(
                "운동",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: gSubButtonColor),
              ),
              SizedBox(width: gap_l),
              Text(
                "댄스",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: gSubButtonColor),
              ),
              SizedBox(width: gap_l),
              Text(
                "뮤직",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: gSubButtonColor),
              ),
              SizedBox(width: gap_l),
              Text(
                "미술",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: gap_l),
              Text(
                "문학",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: gSubButtonColor),
              ),
              SizedBox(width: gap_l),
              Text(
                "공예",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: gSubButtonColor),
              ),
              SizedBox(width: gap_l),
              Text(
                "기타",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: gSubButtonColor),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppbar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1.0,
      leading: IconButton(
          icon: Icon(
            CupertinoIcons.back,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          }),
      title: Text(
        "뷰티 운동",
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
    );
  }
}

// class CategoryList extends StatelessWidget {
//   final int index;
//   const CategoryList({required this.index, Key? key}) : super(key: key);

//   @override
//   Widget build(
//     BuildContext context,
//     CategoryPageModel? model,
//   ) {
//     return;
//   }
// }
