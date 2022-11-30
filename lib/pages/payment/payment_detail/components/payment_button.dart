import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PaymentButton extends StatelessWidget {
  final String path;
  const PaymentButton({required this.path, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 24.0, bottom: 24.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(CupertinoIcons.app),
                    SizedBox(width: 10),
                    Text(
                      "주문 내용을 확인하였으며, 결제에 동의합니다.(필수)",
                      style: TextStyle(fontSize: 14),
                    )
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
            child: ConstrainedBox(
              constraints: BoxConstraints.tightFor(height: 50),
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Color(0xff4880ED),
                    minimumSize: Size(340, 50)),
                onPressed: () {
                  Navigator.pushNamed(context, path);
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
          ),
        ],
      ),
    );
  }
}
