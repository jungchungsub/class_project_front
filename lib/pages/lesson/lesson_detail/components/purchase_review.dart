import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PurchaseReview extends StatelessWidget {
  const PurchaseReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "구매후기 62개",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          _buildReview(),
          _buildReview(),
          _buildReview(),
          _buildReview(),
        ],
      ),
    );
  }

  Container _buildReview() {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(
                      image: NetworkImage("https://picsum.photos/200"),
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "제갈택",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      _buildStar(CupertinoIcons.star_fill),
                      SizedBox(width: 5),
                      _buildStar(CupertinoIcons.star_fill),
                      SizedBox(width: 5),
                      _buildStar(CupertinoIcons.star_fill),
                      SizedBox(width: 5),
                      _buildStar(CupertinoIcons.star_fill),
                      SizedBox(width: 5),
                      _buildStar(CupertinoIcons.star_fill),
                    ],
                  ),
                ],
              )
            ],
          ),
          Text("대박 한거랑 안한거랑 자신감 차이 머야! 평소에 자연스럽게 못해서 아쉬웠는데 방법 진짜 알려줘요",
              style: TextStyle(fontSize: 16)),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }

  Icon _buildStar(IconData mIcon) {
    return Icon(
      mIcon,
      color: Colors.yellow,
      size: 14,
    );
  }
}
