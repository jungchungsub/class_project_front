import 'package:finalproject_front/constants.dart';
import 'package:flutter/material.dart';

class LessonList extends StatelessWidget {
  final String image;
  final String path;
  const LessonList({
    required this.image,
    required this.path,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xffF0F0F0), width: 3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: 90,
                            width: 110,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage("${image}"),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 210,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "깔끔하고 감각적인 최고의 홈페이지를 제작해드립니다.",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                "전문가 : 유리아",
                                style: TextStyle(fontSize: 12),
                              ),
                              Text(
                                "50000원",
                                style: TextStyle(fontSize: 12),
                              ),
                              Text(
                                "마감일자 : 2022.12.07",
                                style: TextStyle(fontSize: 12),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    InkWell(
                      onTap: (() {
                        Navigator.pushNamed(context, "${path}");
                      }),
                      child: Container(
                        width: double.infinity,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: gContentBoxColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "수정하기",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: gButtonOffColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
