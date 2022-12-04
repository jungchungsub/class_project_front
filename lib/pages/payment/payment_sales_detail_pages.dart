import 'package:finalproject_front/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PaymentSalesDetailPage extends StatelessWidget {
  const PaymentSalesDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: ListView(
        children: [_buildTotalSales(), _buildList()],
      ),
    );
  }

  Column _buildTotalSales() {
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

  Column _buildList() {
    return Column(
      children: [
        _buildSalesList(
          "https://picsum.photos/201",
          "깔끔하고 감각적인 최고의 홈페이지를 제작해드립니다.",
          "웹개발",
          "15",
          "50,000원",
          "22.01.09",
        ),
        _buildSalesList(
          "https://picsum.photos/202",
          "깔끔하고 감각적인 최고의 홈페이지를 제작해드립니다.",
          "웹개발",
          "15",
          "50,000원",
          "22.01.09",
        ),
        _buildSalesList(
          "https://picsum.photos/203",
          "깔끔하고 감각적인 최고의 홈페이지를 제작해드립니다.",
          "웹개발",
          "15",
          "50,000원",
          "22.01.09",
        ),
        _buildSalesList(
          "https://picsum.photos/204",
          "깔끔하고 감각적인 최고의 홈페이지를 제작해드립니다.",
          "웹개발",
          "15",
          "50,000원",
          "22.01.09",
        ),
        _buildSalesList(
          "https://picsum.photos/205",
          "깔끔하고 감각적인 최고의 홈페이지를 제작해드립니다.",
          "웹개발",
          "15",
          "50,000원",
          "22.01.09",
        ),
        _buildSalesList(
          "https://picsum.photos/206",
          "깔끔하고 감각적인 최고의 홈페이지를 제작해드립니다.",
          "웹개발",
          "15",
          "50,000원",
          "22.01.09",
        ),
      ],
    );
  }

  Container _buildSalesList(String image, String title, String category,
      String total, String price, String date) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xffF0F0F0), width: 3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: 90,
                            width: 110,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage("${image}"),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 230,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 200,
                                    child: Text(
                                      "${title}.",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Icon(
                                    CupertinoIcons.gear,
                                  )
                                ],
                              ),
                              Text(
                                "카테고리 : ${category}",
                                style: TextStyle(fontSize: 12),
                              ),
                              Text(
                                "총판매 : ${total}개",
                                style: TextStyle(fontSize: 12),
                              ),
                              Text(
                                "가격 : ${price}원",
                                style: TextStyle(fontSize: 12),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    InkWell(
                      onTap: (() {
                        //클래스 수정하기로 가는 링크
                      }),
                      child: Container(
                        width: double.infinity,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: gContentBoxColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${date}",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: gButtonOffColor,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "판매중",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: gButtonOffColor,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
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
        "판매내역",
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
