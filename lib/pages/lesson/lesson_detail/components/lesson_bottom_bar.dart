import 'package:finalproject_front/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(color: gSubButtonColor, width: 2),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "문의",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints.tightFor(height: 50, width: 240),
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Color(0xff4880ED),
                  minimumSize: Size(340, 50)),
              onPressed: () {
                Navigator.pushNamed(context, "/orderDetail");
                //Form에서 현재의 상태 값이 null이 아니라면 /home로 push 해준다.
              },
              child: Text(
                "50,000원 결제하기",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(color: gSubButtonColor, width: 2),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Icon(CupertinoIcons.heart)),
            ),
          )
        ],
      ),
    );
  }
}
