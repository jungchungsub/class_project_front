import 'package:finalproject_front/constants.dart';
import 'package:flutter/material.dart';

class BuyList extends StatelessWidget {
  const BuyList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "구매중인 주문",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              InkWell(
                onTap: () {
                  //전체보기 페이지로 이동
                },
                child: Text(
                  "전체보기",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              color: gContentBoxColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Text(
                "구매중인 주문 내역이 없습니다.",
                style: TextStyle(color: gSubTextColor, fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
