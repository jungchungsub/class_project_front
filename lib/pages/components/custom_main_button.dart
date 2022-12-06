import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/controller/user_controller.dart';
import 'package:finalproject_front/dto/request/user_req_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../dto/request/category_req_dto.dart';

class CustomMainButton extends ConsumerWidget {
  final String buttonText;
  final String buttonRoutePath;
  const CustomMainButton({
    required this.buttonRoutePath,
    required this.buttonText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rc = ref.read(userController);
    List<Category> _selectCategory = [
      Category(id: 1, name: "뷰티"),
      Category(id: 2, name: "운동"),
      Category(id: 3, name: "댄스"),
    ];

    return InkWell(
      onTap: () {
        rc.join(
          UserReqDto(
            username: "cos",
            password: "1234",
            email: "ssar@naver.com",
            phoneNum: "01012345678",
            role: "USER",
            category: _selectCategory,
          ),
        );
        Navigator.pushNamed(context, "${buttonRoutePath}");
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: gButtonOffColor,
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            "${buttonText}",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
