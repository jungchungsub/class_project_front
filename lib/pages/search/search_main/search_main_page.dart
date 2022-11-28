import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SearchMainPage extends StatelessWidget {
  const SearchMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMethod(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 20, bottom: 8),
            child: Text(
              "추천 검색어",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _commendSearch("취미"),
              _commendSearch("운동"),
              _commendSearch("댄스"),
              _commendSearch("뮤직"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _commendSearch("미술"),
              _commendSearch("문학"),
              _commendSearch("공예"),
              _commendSearch("기타"),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 20, bottom: 8),
            child: Text(
              "최근 검색어",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _recentSearch("운동"),
          _recentSearch("부산 공예"),
          _recentSearch("필라테스 유명한곳"),
          _recentSearch("미술학원"),
          _recentSearch("음악공원"),
        ],
      ),
    );
  }

  Padding _recentSearch(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${text}",
            style: TextStyle(fontSize: 14, color: Colors.black),
          ),
          Icon(
            CupertinoIcons.clear_thick,
          )
        ],
      ),
    );
  }

  OutlinedButton _commendSearch(String text) {
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

  AppBar appBarMethod() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1.0,
      leading: Icon(
        CupertinoIcons.back,
        color: Colors.black,
      ),
      title: Text(
        "검색어를 입력하세요.",
        style: TextStyle(
          color: Colors.grey,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      actions: [
        Icon(
          CupertinoIcons.search,
          color: Colors.grey,
        ),
        SizedBox(
          width: 15,
        )
      ],
    );
  }
}
