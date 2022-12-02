import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchDetailPage extends StatefulWidget {
  @override
  State<SearchDetailPage> createState() => _SearchDetailPageState();
}

class _SearchDetailPageState extends State<SearchDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: ListView(
        children: [
          _buildCategoryFilter(),
          _buildCategoryDetail(r"/lessonDetail", "https://picsum.photos/200"),
          _buildCategoryDetail(r"/lessonDetail", "https://picsum.photos/201"),
          _buildCategoryDetail(r"/lessonDetail", "https://picsum.photos/202"),
          _buildCategoryDetail(r"/lessonDetail", "https://picsum.photos/203"),
          _buildCategoryDetail(r"/lessonDetail", "https://picsum.photos/204"),
          _buildCategoryDetail(r"/lessonDetail", "https://picsum.photos/205"),
          _buildCategoryDetail(r"/lessonDetail", "https://picsum.photos/206")
        ],
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

  Padding _buildCategoryDetail(String routePath, String image) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, right: 10, bottom: 8, left: 10),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, "${routePath}");
        },
        child: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8, left: 8, top: 4),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 90,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: NetworkImage("${image}"), fit: BoxFit.cover),
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
                          "깔끔하고 아름다운 웹디자인을 해드립니다아아.",
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
                          Icon(
                            CupertinoIcons.star_fill,
                            color: Colors.yellow,
                            size: 16,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "|   45개의 평가",
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "50,000원",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 140,
                          ),
                          Icon(
                            CupertinoIcons.heart_fill,
                            color: Colors.red,
                            size: 20,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildCategoryFilter() {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        width: 5,
                      ),
                      Text(
                        "초기화",
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ],
                  ),
                  style: OutlinedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  )),
                ),
                _buildMiddleFilterList("예산"),
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
                    "총 100건",
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
                        "인기순",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
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
      onPressed: () {},
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
}
