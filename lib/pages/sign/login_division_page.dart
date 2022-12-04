import 'package:finalproject_front/constants.dart';
import 'package:finalproject_front/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginDivisionPage extends StatelessWidget {
  const LoginDivisionPage({super.key});

  @override
  Widget build(BuildContext context) {
    var mSize = MediaQuery.of(context).size;
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
                    _buildOauthButton(context, "/login", "assets/kakaologinbutton.png"),
                    SizedBox(height: gap_m),
                    _buildOauthButton(context, "/login", "assets/appleloginbutton.png"),
                    SizedBox(height: gap_m),
                    _buildOtherButton(context, "/login", "다른 방법으로 시작"),
                    SizedBox(height: gap_m),
                    _buildBeforeButton(context, "/login", "로그인 전 둘러보기")
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }

  Widget _buildOauthButton(BuildContext context, String routePath, String imagePath) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, routePath);
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
        ),
      ),
    );
  }

  Widget _buildOtherButton(BuildContext context, String routePath, String buttonText) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, routePath);
      },
      child: Container(
        width: double.infinity,
        height: 50,
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            "${buttonText}",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _buildBeforeButton(BuildContext context, String routePath, String buttonText) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, routePath);
      },
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            "${buttonText}",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: gSubTextColor,
            ),
          ),
        ),
      ),
    );
  }
}
