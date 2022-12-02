import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PaymentButton extends StatelessWidget {
  final String routePath;
  const PaymentButton({required this.routePath, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: Color(0xff4880ED), minimumSize: Size(340, 50)),
        onPressed: () {
          Navigator.pushNamed(context, routePath);
          //Form에서 현재의 상태 값이 null이 아니라면 /home로 push 해준다.
        },
        child: Text(
          "다음",
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
