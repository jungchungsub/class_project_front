import 'package:finalproject_front/pages/category/category_detail/components/header_category.dart';
import 'package:finalproject_front/pages/search/search_detail/components/category_datil_body.dart';
import 'package:finalproject_front/pages/search/search_detail/components/middle_filter.dart';
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
            child: HeaderCategory(),
          ),
          Image.asset(
            "assets/home1.jpg",
            fit: BoxFit.cover,
            height: 120,
          ),
          MiddleFilter(),
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
}
