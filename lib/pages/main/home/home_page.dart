import 'package:finalproject_front/pages/main/home/components/home_body.dart';
import 'package:finalproject_front/pages/main/home/components/home_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [],
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 160,
              height: 35,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black87),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(
                      CupertinoIcons.search,
                      color: Colors.black,
                      size: 20,
                    ),
                    Text(
                      "Search...",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Icon(
            CupertinoIcons.bell,
            color: Colors.black,
            size: 30,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverList(
                delegate: SliverChildListDelegate([
              Container(
                child: HomeHeader(),
              ),
              Container(
                color: Colors.black12,
                height: 2,
              ),
            ]))
          ];
        },
        body: _buildTabBarView(),
      ),
    );
  }

  Widget _buildTabBarView() {
    return Padding(
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
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Column(
                children: [
                  Expanded(child: Image.asset("assets/home1.jpg", fit: BoxFit.cover)),
                  SizedBox(height: 10),
                  Text(
                    "안녕하세요 저희 서비스에 오셔서 감사합니다. ",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Icon(CupertinoIcons.heart_fill, color: Colors.red, size: 15),
                      SizedBox(width: 10),
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
    );
  }
}

OutlineInputBorder _builderOutLineInputBorder() {
  return OutlineInputBorder(
    borderSide: const BorderSide(width: 0.5, color: Color(0xFFD4D5DD)),
    borderRadius: BorderRadius.circular(8.0),
  );
}
