import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class JoinDivisionPage extends StatelessWidget {
  const JoinDivisionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 100),
              Text(
                "어떤 서비스를 이용하고 싶으신가요?",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text.rich(
                TextSpan(children: [
                  TextSpan(text: "원하는 회원가입 유형을 선택하세요.\n"),
                  TextSpan(text: "의뢰인으로 가입후에도 전문가 등록이 가능합니다.")
                ], style: TextStyle(color: Color(0xff6C6C6C))),
              ),
              SizedBox(height: 300),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "비즈니스 외주, 아웃소싱을 원한다면",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Color(0xff6C6C6C),
                            ),
                          ),
                          Text(
                            "의뢰인으로 가입",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Icon(CupertinoIcons.forward)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("전문성으로 수익창출을 원한다면"),
                      Text("전문가로으로 가입"),
                    ],
                  ),
                  Icon(CupertinoIcons.forward)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
