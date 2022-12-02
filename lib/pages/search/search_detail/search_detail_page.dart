import 'package:finalproject_front/pages/search/search_detail/components/category_datil.dart';
import 'package:finalproject_front/pages/search/search_detail/components/category_filter.dart';
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
          CategoryFilter(),
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
