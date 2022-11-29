import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/pages/sign/join_division_page/components/division_button.dart';
import 'package:finalproject_front/pages/sign/join_division_page/components/intro_text.dart';
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
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: [
              SizedBox(height: 50),
              SizedBox(
                width: double.infinity,
                child: IntroText(),
              ),
              SizedBox(height: 300),
              DivisionButton(
                  context: context,
                  subtitle: "비즈니스 외주,아웃소싱을 원한다면",
                  title: "의뢰인으로 가입"),
              SizedBox(height: 20),
              DivisionButton(
                  context: context,
                  subtitle: "전문성으로 수익창출을 원한다면",
                  title: "전문가로 가입"),
            ],
          ),
        ),
      ),
    );
  }
}
