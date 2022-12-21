import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/controller/category_controller.dart';

import 'package:finalproject_front/domain/category.dart';
import 'package:finalproject_front/dto/response/category_resp_dto.dart';

import 'package:finalproject_front/dummy_models/lesson_category_list_resp_dto.dart';
import 'package:finalproject_front/pages/category/components/category_page_model.dart';
import 'package:finalproject_front/pages/category/components/category_page_view_model.dart';
import 'package:finalproject_front/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:logger/logger.dart';

class CategoryDetailPage extends ConsumerStatefulWidget {
  CategoryDetailPage({required this.categoryId, Key? key}) : super(key: key);
  final int categoryId;

  @override
  ConsumerState<CategoryDetailPage> createState() => _CategoryDetailPageState();
}

class _CategoryDetailPageState extends ConsumerState<CategoryDetailPage> {
  @override
  Widget build(BuildContext context) {
    CategoryPageModel? model = ref.watch(categoryPageViewModel(widget.categoryId));
    CategoryController categoryCT = ref.read(categorryController);
    if (model == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      List<CategoryRespDto>? categoryList = model.categoryList;
      if (categoryList == null) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return Scaffold(
            appBar: _buildAppbar(context, ref, model),
            body: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Text(
                    "크몽에 오신것을 환영합니다!",
                    style: TextStyle(fontSize: 16),
                  )),
                ),
                Image.asset(
                  "assets/home1.jpg",
                  fit: BoxFit.cover,
                  height: 120,
                ),
                _buildCategoryFilter("등록순", categoryList.length, widget.categoryId, ref),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: categoryList.length,
                    itemBuilder: ((BuildContext context, int index) {
                      return _buildCateogryList(context, ref, index, categoryList, categoryCT);
                    })),
              ],
            ));
      }
    }
  }

  Padding _buildCateogryList(BuildContext context, WidgetRef ref, int index, List<CategoryRespDto> categoryList, CategoryController categoryCT) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, right: 10, bottom: 8, left: 10),
      child: InkWell(
        onTap: () {
          categoryCT.moveDetailPage(lessonId: categoryList[index].lessonId);
        },
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
                        "${categoryList[index].lessonName}",
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
                        RatingBarIndicator(
                          rating: categoryList[index].avgGrade,
                          itemBuilder: (context, index) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemCount: 5,
                          itemSize: 14.0,
                          direction: Axis.horizontal,
                        ),
                        SizedBox(
                          width: gap_s,
                        ),
                        Text(
                          "| ${categoryList[index].totalReviews}개의 평가",
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    Container(
                      width: 230,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${categoryList[index].lessonPrice}원",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            CupertinoIcons.heart_fill,
                            color: Colors.red,
                            size: 14,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildCategoryFilter(String budget, int total, int categoryId, WidgetRef ref) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 10, right: 10),
            child: Row(
              children: [
                SizedBox(width: gap_l),
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
                    "총 ${total} 건",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                DropdownButtonExample(categoryId: categoryId)
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildHeaderCategory(
      String total, String beauty, String sports, String dance, String music, String read, String literature, String art, String etc) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Text(
                      "${total}",
                      style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(width: gap_m),
              TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Text(
                      "${beauty}",
                      style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(width: gap_m),
              TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Text(
                      "${sports}",
                      style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(width: gap_m),
              TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Text(
                      "${dance}",
                      style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(width: gap_m),
              TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Text(
                      "${music}",
                      style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(width: gap_m),
              TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Text(
                      "${read}",
                      style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(width: gap_m),
              TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Text(
                      "${literature}",
                      style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(width: gap_m),
              TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Text(
                      "${art}",
                      style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(width: gap_m),
              TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Text(
                      "${etc}",
                      style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppbar(BuildContext context, WidgetRef ref, CategoryPageModel? model) {
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
        "운동",
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

List<String> list = <String>['등록순', '인기순', '추천순'];

class DropdownButtonExample extends ConsumerStatefulWidget {
  final int categoryId;
  const DropdownButtonExample({required this.categoryId, super.key});

  @override
  ConsumerState<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends ConsumerState<DropdownButtonExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      elevation: 16,
      style: const TextStyle(color: Colors.black),
      onChanged: (String? value) {
        setState(() {
          dropdownValue = value!;
          Logger().d("드롭다운 버튼 변경됨 : $dropdownValue");

          ref.read(categoryPageViewModel(widget.categoryId).notifier).notifyViewModel(dropdownValue);
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
