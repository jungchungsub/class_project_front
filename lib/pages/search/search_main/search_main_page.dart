import 'package:finalproject_front/pages/search/search_main/components/recentSearch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'components/commend_search.dart';

class SearchMainPage extends StatelessWidget {
  const SearchMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
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
              CommendSearch(text: "취미"),
              CommendSearch(text: "운동"),
              CommendSearch(text: "댄스"),
              CommendSearch(text: "뮤직"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CommendSearch(text: "미술"),
              CommendSearch(text: "문학"),
              CommendSearch(text: "공예"),
              CommendSearch(text: "기타"),
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
          RecentSearch(text: "운동"),
          RecentSearch(text: "부산 공예"),
          RecentSearch(text: "필라테스 유명한곳"),
          RecentSearch(text: "미술학원"),
          RecentSearch(text: "음악공원"),
        ],
      ),
    );
  }
}
