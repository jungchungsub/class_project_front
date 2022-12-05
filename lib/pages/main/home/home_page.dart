import 'package:finalproject_front/constants.dart';

import 'package:finalproject_front/pages/main/home/components/category_select.dart';

import 'package:finalproject_front/pages/search/search_detail_page.dart';
import 'package:finalproject_front/pages/search/search_main_page.dart';
import 'package:finalproject_front/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          body: _buildClassList(context, "/lessonDetail")),
    );
  }

  InkWell _buildClassList(BuildContext context, String routePath) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "${routePath}");
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 10,
              crossAxisCount: 2,
              mainAxisSpacing: 10,
            ),
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  children: [
                    Container(
                      height: 90,
                      width: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(image: NetworkImage("https://picsum.photos/id/${index + 1}/200"), fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(height: gap_m),
                    Text(
                      "안녕하세요 저희 서비스에 오셔서 감사합니다. ",
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children: [
                        Icon(CupertinoIcons.heart_fill, color: Colors.red, size: 15),
                        SizedBox(width: gap_m),
                        Text(
                          "4.5 | 25개의 평가",
                          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "50000원",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
      ),
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
