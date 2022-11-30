import 'package:flutter/material.dart';

import 'before_login_button.dart';
import 'oauth_button.dart';
import 'other_button.dart';

class LoginButtonForm extends StatelessWidget {
  const LoginButtonForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/background.gif"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 80,
          left: 20,
          child: Container(
            width: 350,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  OauthButton(context: context, routeName: "/login", imagePath: "assets/kakaologinbutton.png"),
                  SizedBox(height: 8),
                  OauthButton(context: context, routeName: "/login", imagePath: "assets/appleloginbutton.png"),
                  SizedBox(height: 8),
                  OtherButton(),
                  SizedBox(height: 8),
                  BeforeLoginButton()
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
