import 'package:finalproject_front/pages/payment/payment_inform/components/email_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class EmailTextForm extends StatelessWidget {
  const EmailTextForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "이메일",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(height: 10),
            EmailTextFormField(text: "이메일")
          ],
        ),
      ),
    );
  }
}
