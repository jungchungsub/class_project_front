import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LectureDetailPage extends StatelessWidget {
  const LectureDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      // layoutBuilder안에 넣는 이유는 해당디바이스 사이즈를 알기위해서 넣어준다.
      builder: (context, constrains) {
        Size _size = MediaQuery.of(context).size; //해당 디바이스의 사이즈를 가지고 온다.
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              //child같은 개념이지만 조금 다르다
              SliverAppBar(
                  leading: Icon(CupertinoIcons.back),
                  pinned: true,
                  //리스트시 앱바가 위에 고정되게 해준다.
                  expandedHeight: _size.width,
                  //이미지보여줄 가로세로 길이를 동일하게 해준다. //디바이스 가로 길이만큼 준다.

                  primary: true,
                  flexibleSpace: Stack(
                    children: [
                      FlexibleSpaceBar(
                        background: SizedBox(
                          height: _size.width,
                          width: _size.width,
                          child: ExtendedImage.network(
                            "https://picsum.photos/200",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      FlexibleSpaceBar(
                        collapseMode: CollapseMode.none,
                        background: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [Colors.black38, Colors.transparent],
                                  stops: [0.0, 0.15] //gradient가 어떻게 자리를 잡을 것인지
                                  )),
                        ),
                      )
                    ],
                  )),
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  //builder메소드를 넣어줘야한다. CustomScrollView에 넣어줄수 있는 SliverList이다
                  return Container(
                    height: 100,
                    color: Colors.accents[index % Colors.accents.length],
                  ); //index를 컬러 숫자 만큼 나눈 나머지다. accentColor가 처음부터 끝까지 실행될수 있게끔한다.
                }, childCount: 10),
              ),
              //container같은 보통위젯들은 바로 주지 못한다.
              //만약사용하고 싶다면 아래와 같이 SliverToBoxAdapter로 감싸준다.
              //SliverToBoxAdapter(child: Container()),
            ],
          ),
        );
      },
    );
  }
}
