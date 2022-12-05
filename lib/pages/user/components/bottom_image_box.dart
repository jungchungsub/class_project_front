import 'package:flutter/material.dart';

class BottomImageBox extends StatelessWidget {
  const BottomImageBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 125,
      // width: double.infinity,
      width: size.width, // 미디어 쿼리 사용해서 넓이를 기기마다 맞게 설정 해줌.
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(image: NetworkImage("https://picsum.photos/200"), fit: BoxFit.cover),
      ),
    );
  }
}
