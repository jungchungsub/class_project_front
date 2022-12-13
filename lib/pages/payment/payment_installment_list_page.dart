import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PaymentInstallmentListPage extends StatelessWidget {
  const PaymentInstallmentListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: ListView(
        children: [
          _buildInstallmentLists(context),
        ],
      ),
    );
  }

  Column _buildInstallmentLists(
    BuildContext context,
  ) {
    return Column(
      children: [
        SizedBox(height: gap_l),
        _buildSalesList(context, "깔끔하고 감각적인 최고의 홈페이지를 제작해드립니다", "50,000",
            "22.01.09", "/lessonDetail"),
        SizedBox(height: gap_l),
        _buildSalesList(context, "출장 메이크업을 합리적인 가격에 진행해 드립니다", "77,000",
            "22.01.09", "/lessonDetail"),
        SizedBox(height: gap_l),
        _buildSalesList(context, "천연향료 에센셜오일을 알아본 후 향수를 만들어드립니다", "70,000",
            "22.01.09", "/lessonDetail"),
        SizedBox(height: gap_l),
        _buildSalesList(context, "레슨경력 7년차 전문댄서가 맞춤형 댄스 수업해 드립니다", "50,000",
            "22.01.09", "/lessonDetail"),
        SizedBox(height: gap_l),
        _buildSalesList(context, "깔끔하고 감각적인 최고의 홈페이지를 제작해드립니다", "50,000",
            "22.01.09", "/lessonDetail"),
        SizedBox(height: gap_l),
        _buildSalesList(context, "깔끔하고 감각적인 최고의 홈페이지를 제작해드립니다", "50,000",
            "22.01.09", "/lessonDetail"),
        SizedBox(height: gap_l),
        _buildSalesList(context, "깔끔하고 감각적인 최고의 홈페이지를 제작해드립니다", "50,000",
            "22.01.09", "/lessonDetail"),
        SizedBox(height: gap_l),
        _buildSalesList(context, "깔끔하고 감각적인 최고의 홈페이지를 제작해드립니다", "50,000",
            "22.01.09", "/lessonDetail"),
        SizedBox(height: gap_l),
      ],
    );
  }

  InkWell _buildSalesList(
      context, String saletitle, String price, String date, String routePath) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "${routePath}");
      },
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: gBorderColor, width: 3),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 320,
                        height: 50,
                        child: Text(
                          "${saletitle}.",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "가격 : ${price}원",
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(
                            "결제 날짜 : ${date}",
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppbar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1.0,
      leading: IconButton(
          icon: Icon(
            CupertinoIcons.back,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          }),
      title: Text(
        "결제/취소내역",
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
    );
  }
}
