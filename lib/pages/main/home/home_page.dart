import 'package:finalproject_front/pages/main/home/components/category_select.dart';
import 'package:finalproject_front/pages/main/home/components/class_list.dart';
import 'package:finalproject_front/pages/payment/payment_detail/components/class_time.dart';
import 'package:finalproject_front/pages/search/search_detail/search_detail_page.dart';
import 'package:finalproject_front/pages/search/search_main/search_main_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _homePageAppBar(),
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
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          "assets/home1.jpg",
                          fit: BoxFit.cover,
                          height: 100,
                          width: 400,
                        ),
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CategorySelect(
                              path: "assets/sports.png", text: "뷰티・운동"),
                          CategorySelect(
                              path: "assets/Headphones.png", text: "댄스・뮤직"),
                          CategorySelect(path: "assets/art.png", text: "미술・문학"),
                          CategorySelect(
                              path: "assets/Search.png", text: "공예・기타"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                color: Colors.black,
                height: 2,
              )
            ]))
          ];
        },
        body: ClassList(),
      ),
    );
  }

  AppBar _homePageAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1.0,
      actions: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: OutlinedButton(
            onPressed: () {},
            child: Row(
              children: [
                Icon(
                  CupertinoIcons.search,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 5,
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
          width: 10,
        ),
        Icon(
          CupertinoIcons.bell,
          color: Colors.black,
          size: 26,
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
