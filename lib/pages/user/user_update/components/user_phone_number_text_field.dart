import 'package:finalproject_front/constants.dart';
import 'package:flutter/material.dart';

class UserPhoneNumberTextField extends StatelessWidget {
  final Function scrollAnimate;
  const UserPhoneNumberTextField(
    this.scrollAnimate, {
    Key? key,
    required TextEditingController phoneNumberController,
  })  : _phoneNumberController = phoneNumberController,
        super(key: key);

  final TextEditingController _phoneNumberController;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "전화번호",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            onTap: (() {
              scrollAnimate;
            }),
            //validator: , 유효성 체크 부분
            controller: _phoneNumberController,
            decoration: InputDecoration(
              //3. 기본 textFormfield 디자인 - enabledBorder
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: gBorderColor, width: 3.0),
                borderRadius: BorderRadius.circular(10),
              ),
              //마우스 올리고 난 후 스타일
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: gBorderColor, width: 3.0),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
