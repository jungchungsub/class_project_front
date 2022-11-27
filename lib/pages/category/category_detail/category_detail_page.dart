import 'package:finalproject_front/pages/category/category_detail/components/category_detail_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryDetailPage extends StatefulWidget {
  @override
  State<CategoryDetailPage> createState() => _CategoryDetailPageState();
}

class _CategoryDetailPageState extends State<CategoryDetailPage> {
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
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
            ),
          ),
          Image.asset(
            "assets/home1.jpg",
            fit: BoxFit.cover,
            height: 120,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
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
                OutlinedButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Text(
                        "예산",
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ],
                  ),
                  style: OutlinedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  )),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Text(
                        "지역",
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ],
                  ),
                  style: OutlinedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  )),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Text(
                        "모집형태",
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ],
                  ),
                  style: OutlinedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  )),
                ),
              ],
            ),
          ),
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
}
