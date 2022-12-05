import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SearchMainPage extends StatelessWidget {
  const SearchMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
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
              _buildCommendSearch(context, "취미", "/searchDetail"),
              _buildCommendSearch(context, "운동", "/searchDetail"),
              _buildCommendSearch(context, "댄스", "/searchDetail"),
              _buildCommendSearch(context, "뮤직", "/searchDetail")
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildCommendSearch(context, "미술", "/searchDetail"),
              _buildCommendSearch(context, "문학", "/searchDetail"),
              _buildCommendSearch(context, "공예", "/searchDetail"),
              _buildCommendSearch(context, "기타", "/searchDetail")
            ],
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
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

  OutlinedButton _buildCommendSearch(BuildContext context, String textCategory, String routePath) {
    return OutlinedButton(
      onPressed: () {
        Navigator.pushNamed(context, routePath);
      },
      child: Row(
        children: [
          Text(
            "${textCategory}",
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
