import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/pages/payment/payment_sales_detail/components/sales_list.dart';
import 'package:finalproject_front/pages/payment/payment_sales_detail/components/total_sales.dart';
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
        children: [TotalSales(), _buildList()],
      ),
    );
  }

  Column _buildList() {
    return Column(
      children: [
        SalesList(
            image: "https://picsum.photos/200",
            title: "깔끔하고 감각적인 최고의 홈페이지를 제작해드립니다.",
            category: "웹개발",
            total: "15",
            price: "50,000원",
            date: "22.01.09"),
        SalesList(
            image: "https://picsum.photos/201",
            title: "깔끔하고 감각적인 최고의 홈페이지를 제작해드립니다.",
            category: "웹개발",
            total: "15",
            price: "50,000원",
            date: "22.01.09"),
        SalesList(
            image: "https://picsum.photos/202",
            title: "깔끔하고 감각적인 최고의 홈페이지를 제작해드립니다.",
            category: "웹개발",
            total: "15",
            price: "50,000원",
            date: "22.01.09"),
        SalesList(
            image: "https://picsum.photos/203",
            title: "깔끔하고 감각적인 최고의 홈페이지를 제작해드립니다.",
            category: "웹개발",
            total: "15",
            price: "50,000원",
            date: "22.01.09"),
        SalesList(
            image: "https://picsum.photos/204",
            title: "깔끔하고 감각적인 최고의 홈페이지를 제작해드립니다.",
            category: "웹개발",
            total: "15",
            price: "50,000원",
            date: "22.01.09"),
      ],
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
