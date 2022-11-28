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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        leading: Icon(
          CupertinoIcons.back,
          color: Colors.black,
        ),
        title: Text(
          "뷰티 운동",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          _middleFilter(),
          _totallistBar(),
          CategoryDetailBody(),
          CategoryDetailBody(),
          CategoryDetailBody(),
          CategoryDetailBody(),
          CategoryDetailBody(),
          CategoryDetailBody(),
        ],
      ),
    );
  }

  Padding _middleFilter() {
    return Padding(
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
          _middleFilterList("예산"),
          _middleFilterList("지역"),
          _middleFilterList("등급"),
        ],
      ),
    );
  }

  Row _headerCategory() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "전체",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        Text(
          "뷰티・운동",
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xff6c6c6c)),
        ),
        Text(
          "댄스・뮤직",
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xff6c6c6c)),
        ),
        Text(
          "미술・문학",
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xff6c6c6c)),
        ),
        Text(
          "공예・기타",
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xff6c6c6c)),
        ),
      ],
    );
  }

  OutlinedButton _middleFilterList(String text) {
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

  Padding _totallistBar() {
    return Padding(
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
    );
  }

  Padding CategoryDetailBody() {
    return Padding(
      padding: const EdgeInsets.only(top: 6, right: 8, bottom: 8, left: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8, left: 8, top: 4),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                "assets/home1.jpg",
                fit: BoxFit.cover,
                width: 110,
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "깔끔하고 아름다운aaaaaaaa2",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
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
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "50,000원",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
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
}
