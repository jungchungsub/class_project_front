import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, //1 개의 행에 보여줄 item 개수
        ),
        children: [
          Container(color: Colors.yellow),
        ],
      ),
    );
  }
}
