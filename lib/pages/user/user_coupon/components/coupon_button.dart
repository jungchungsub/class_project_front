import 'package:finalproject_front/constants.dart';
import 'package:flutter/material.dart';

class CouponButton extends StatelessWidget {
  const CouponButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 30,
      right: 15,
      child: Container(
        width: 100,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: gContentBoxColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "쿠폰등록",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: gButtonOffColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
