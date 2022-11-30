import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/pages/user/user_inform/components/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class UserLoginMypage extends StatelessWidget {
  const UserLoginMypage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        children: [
          Profile(),
          BuyItems(),
          MyService(),
          Row(
            children: [
              Container(
                height: 125,
                width: 330,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage("https://picsum.photos/200"),
                      fit: BoxFit.cover),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      elevation: 1.0,
      leading: IconButton(
        onPressed: () {},
        icon: Icon(
          CupertinoIcons.bell,
          color: Colors.black,
          size: 26,
        ),
      ),
      centerTitle: true,
      title: TextButton(
        onPressed: () {},
        child: Text(
          "로고",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 15, right: 20),
          child: InkWell(
            onTap: () {},
            child: Text(
              "계정 설정",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

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
          _myService("결제/환불내역"),
          SizedBox(height: 10),
          _myService("쿠폰/프로모션"),
          SizedBox(height: 10),
          _myService("고객센터"),
        ],
      ),
    );
  }

  Row _myService(String service) {
    return Row(
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
    );
  }
}

class BuyItems extends StatelessWidget {
  const BuyItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
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
