import 'package:finalproject_front/models/subscribe_list_resp_dto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubscribeMainPage extends StatefulWidget {
  const SubscribeMainPage({Key? key}) : super(key: key);

  @override
  State<SubscribeMainPage> createState() => _SubscribeMainPageState();
}

class _SubscribeMainPageState extends State<SubscribeMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppbar(),
        body: ListView.builder(
            shrinkWrap: true, //리스트 자식 높이 크기의 합 만큼으로 영역을 고정 시켜준다.
            itemCount: subscribeListRespDto.length,
            itemBuilder: ((BuildContext context, int index) {
              return _buildLikeList(
                "/lessonDetail",
                "https://picsum.photos/201",
                "깔끔하고 아름다운 웹디자인을 해드립니다.",
                45,
                "50,000",
              );
            })));
  }

  Padding _buildLikeList(String routePath, String imagePath, String likeTitle, int likeEvaluation, String price) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, right: 10, bottom: 8, left: 10),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, "${routePath}");
        },
        child: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8, left: 8, top: 4),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 90,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(image: NetworkImage("${imagePath}"), fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 220,
                        height: 50,
                        child: Text(
                          "${likeTitle}",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
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
                            "|  ${likeEvaluation}개의 평가",
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "${price}원",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 140,
                          ),
                          Icon(
                            CupertinoIcons.heart_fill,
                            color: Colors.red,
                            size: 20,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppbar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1.0,
      title: Text(
        "찜목록",
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 15, right: 20),
          child: Text(
            "필터",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
