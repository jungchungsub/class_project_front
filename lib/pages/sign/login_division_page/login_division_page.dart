import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/pages/sign/login_division_page/components/before_login_button.dart';
import 'package:finalproject_front/pages/sign/login_division_page/components/login_button_form.dart';
import 'package:finalproject_front/pages/sign/login_division_page/components/oauth_button.dart';
import 'package:finalproject_front/pages/sign/login_division_page/components/other_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginDivisionPage extends StatelessWidget {
  const LoginDivisionPage({super.key});

  @override
  Widget build(BuildContext context) {
    var mSize = MediaQuery.of(context).size;
    print("width는? ${mSize.width}");
    print("widt는?${mSize.width / 20}");
    return Scaffold(
      body: SafeArea(
          child: Stack(
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
            top: mSize.height * 0.5,
            left: mSize.width / 20,
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
      )),
    );
  }
}
