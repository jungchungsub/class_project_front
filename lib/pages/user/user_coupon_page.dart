import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/models/coupon_list_resp_dto.dart';
import 'package:finalproject_front/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserCouponPage extends StatelessWidget {
  const UserCouponPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: gap_l),
                      _buildCouponTextFormField(context, "쿠폰"),
                    ],
                  ),
                  _buildCouponButton()
                ],
              ),
              SizedBox(height: gap_l),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "사용 가능한 쿠폰",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    // ViewModel만들고 데이터 가공 필요함.
                    TextSpan(text: "12", style: TextStyle(fontSize: 16, color: gButtonOffColor, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              SizedBox(height: gap_l),
              ListView.builder(
                shrinkWrap: true, //리스트 자식 높이 크기의 합 만큼으로 영역을 고정 시켜준다.
                physics: const NeverScrollableScrollPhysics(), // 스크롤이 안되도록 고정
                itemCount: couponListRespDto.length,
                itemBuilder: ((context, index) {
                  return CouponCard(itemIndex: index);
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Positioned _buildCouponButton() {
    return Positioned(
      top: 50,
      right: 15,
      child: Container(
        width: 100,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: gContentBoxColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(6),
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

  AppBar _buildAppbar(BuildContext context) {
    return AppBar(
      elevation: 1.0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          CupertinoIcons.back,
          color: Colors.black,
          size: 26,
        ),
      ),
      centerTitle: true,
      title: TextButton(
        onPressed: () {},
        child: Text(
          "쿠폰",
          style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

Widget _buildCouponTextFormField(BuildContext context, String text) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: gap_l),
      TextFormField(
        //1. 값이 없으면 plase enter some text 경고 화면 표시
        validator: (value) => value!.isEmpty ? "${text}을 입력해주세요." : null, // 입력된 값은 value에 저장된다.
        decoration: InputDecoration(
            hintText: "${text}를 입력해주세요",
            hintStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: gSubTextColor,
            ),
            //3. 기본 textFormfield 디자인 - enabledBorder
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: gBorderColor, width: 3.0),
              borderRadius: BorderRadius.circular(10),
            ),
            //4. 터치시 TextFormField디자인 - focusedBorder
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: gBorderColor, width: 3.0),
              borderRadius: BorderRadius.circular(10),
            ),
            //5. 에러 발생시 TextformField디자인 - errorBorder
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: gBorderColor, width: 3.0),
              borderRadius: BorderRadius.circular(10),
            ),
            //6. 에러 발생 후 손가락 터치 디자인  - focusedErrorBorder
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: gBorderColor, width: 3.0),
              borderRadius: BorderRadius.circular(10),
            )),
      ),
    ],
  );
}

class CouponCard extends StatelessWidget {
  final int itemIndex;
  const CouponCard({
    required this.itemIndex,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            // border: Border(
            //   top: BorderSide(width: 3.0, color: gBorderColor),
            //   bottom: BorderSide(width: 3.0, color: gBorderColor),
            //   left: BorderSide(width: 3.0, color: gPrimaryColor),
            //   right: BorderSide(width: 3.0, color: gBorderColor),
            // ),
            // color: Colors.white,
            border: Border.all(color: gBorderColor, width: 3),
            gradient: LinearGradient(
              stops: [0.02, 0.02],
              colors: [gPrimaryColor, Colors.white],
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${couponListRespDto[itemIndex].price}원",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          // ViewModel만들고 난 이후 데이터 가공 필요함.
                          TextSpan(text: "10", style: TextStyle(fontSize: 14, color: gButtonOffColor, fontWeight: FontWeight.bold)),
                          TextSpan(text: " 일 남음", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: gap_m),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    "${couponListRespDto[itemIndex].title}",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  "${couponListRespDto[itemIndex].expiredDate}까지 사용 가능",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: gSubTextColor),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: gap_l),
      ],
    );
  }
}
