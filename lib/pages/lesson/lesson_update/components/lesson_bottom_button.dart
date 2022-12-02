import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class LessonBottomButton extends StatelessWidget {
  const LessonBottomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Color(0xff4880ED),
                  minimumSize: Size(150, 50)),
              onPressed: () {
                //Form에서 현재의 상태 값이 null이 아니라면 /home로 push 해준다.
              },
              child: Text(
                "수정",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Color(0xff4880ED),
                  minimumSize: Size(150, 50)),
              onPressed: () {
                //Form에서 현재의 상태 값이 null이 아니라면 /home로 push 해준다.
              },
              child: Text(
                "삭제",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
