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
                      _buildRow(),
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
        body: _buildTabBarView(),
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
          size: 30,
        ),
        SizedBox(
          width: 10,
        ),
      ],
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
                  Expanded(
                      child:
                          Image.asset("assets/home1.jpg", fit: BoxFit.cover)),
                  SizedBox(height: 10),
                  Text(
                    "안녕하세요 저희 서비스에 오셔서 감사합니다. ",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Icon(CupertinoIcons.heart_fill,
                          color: Colors.red, size: 15),
                      SizedBox(width: 10),
                      Text(
                        "4.5 | 25개의 평가",
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
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

Row _buildRow() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      _mainCategroy(Icons.bike_scooter, "뷰티・운동"),
      _mainCategroy(Icons.music_note, "댄스・뮤직"),
      _mainCategroy(Icons.article_rounded, "미술・문학"),
      _mainCategroy(Icons.art_track, "공예・기타"),
    ],
  );
}

Column _mainCategroy(IconData mIcon, String text) {
  return Column(
    children: [
      _buildDetailIcon(mIcon),
      Text("${text}"),
    ],
  );
}

Widget _buildDetailIcon(IconData mIcon) {
  return Padding(
    padding: EdgeInsets.all(10),
    child: Stack(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        Positioned(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(mIcon),
            ),
          ),
        )
      ],
    ),
  );
}
