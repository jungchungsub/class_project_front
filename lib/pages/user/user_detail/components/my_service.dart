import 'package:finalproject_front/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyService extends StatelessWidget {
  const MyService({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "나의 서비스",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          _buildMyService(context, "결제/환불내역", ""),
          SizedBox(height: 10),
          _buildMyService(context, "쿠폰/프로모션", "/userCoupon"),
          SizedBox(height: 10),
          _buildMyService(context, "고객센터", "/customerService")
        ],
      ),
    );
  }

  _buildMyService(context, String service, String path) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, path);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$service",
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: gSubTextColor),
          ),
          Icon(
            CupertinoIcons.right_chevron,
            size: 14,
            color: gSubTextColor,
          )
        ],
      ),
    );
  }
}
