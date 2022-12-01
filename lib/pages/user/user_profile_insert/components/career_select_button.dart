import 'package:finalproject_front/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:finalproject_front/pages/user/user_profile_insert/components/career_list';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CareerSelectButton extends StatelessWidget {
  const CareerSelectButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "할부",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: gBorderColor, width: 3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: CareerList(),
              width: size.width,
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
