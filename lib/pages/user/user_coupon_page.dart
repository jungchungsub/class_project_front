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
                      text: "사용 가능한 쿠폰 ",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: "12", style: TextStyle(fontSize: 16, color: gButtonOffColor, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              SizedBox(height: gap_l),
              ListView.builder(
                shrinkWrap: true, //리스트 자식 높이 크기의 합 만큼으로 영역을 고정 시켜준다.
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

class CouponCard extends StatelessWidget {
  final int itemIndex;
  const CouponCard({
    required this.itemIndex,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: gBorderColor, width: 3),
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
                  "${couponListRespDto[itemIndex].id}",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: "${"14"}", style: TextStyle(fontSize: 14, color: gButtonOffColor, fontWeight: FontWeight.bold)),
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
                "${"신규회원 디자인 1만원 할인"}",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              "${"30,000원 이상 구매시 최대 10"}",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Text(
              "${"2022.12.07 15:50까지"}",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: gSubTextColor),
            ),
          ],
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
        // 2. 해당 textformfield가 비밀번호 입력 양식이라면 ***표시 처리 해줌.
        obscureText: text == "Password" ? true : false,
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
