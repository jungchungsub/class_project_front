import 'package:finalproject_front/constants.dart';
import 'package:flutter/material.dart';

class TotalSales extends StatelessWidget {
  const TotalSales({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30),
        Container(
          height: 100,
          color: gContentBoxColor,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "판매완료 금액",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: gPrimaryColor),
                  ),
                  Text(
                    "50,000원",
                    style: TextStyle(fontSize: 16, color: gPrimaryColor),
                  )
                ],
              ),
              Container(
                height: 60,
                width: 1,
                color: gBorderColor,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "판매중",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: gPrimaryColor),
                    ),
                    Text(
                      "10개",
                      style: TextStyle(fontSize: 16, color: gPrimaryColor),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
