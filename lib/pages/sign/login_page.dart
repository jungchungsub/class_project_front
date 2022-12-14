import 'package:finalproject_front/controller/user_controller.dart';
import 'package:finalproject_front/domain/user.dart';
import 'package:finalproject_front/pages/components/custom_text_field.dart';
import 'package:finalproject_front/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants.dart';

class LoginPage extends ConsumerStatefulWidget {
  LoginPage({super.key});
  final _id = TextEditingController();
  final _password = TextEditingController();

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  late ScrollController scrollController; // ScrollerController은 non-null이다, late를 선언해 나중에 초기화.

  @override
  void initState() {
    super.initState();
    scrollController = new ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    final uc = ref.read(userController);
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _loginForm(context, uc),
    );
  }

  Form _loginForm(BuildContext context, UserController uc) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(gap_l),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(scrollAnimate, fieldTitle: "아이디", hint: "아이디를 입력해주세요.", lines: 1, fieldController: widget._id),
              SizedBox(height: gap_l),
              CustomTextField(scrollAnimate, fieldTitle: "비밀번호", hint: "비밀번호를 입력해주세요.", lines: 1, fieldController: widget._password),
              SizedBox(height: gap_l),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildOauthLogin("assets/kakaologin.png"),
                  SizedBox(width: gap_l),
                  _buildOauthLogin("assets/applelogin.png"),
                ],
              ),
              SizedBox(height: gap_l),
              ElevatedButton(
                onPressed: () async {
                  await uc.loginUser(username: widget._id.text.trim(), password: widget._password.text.trim());
                },
                style: ElevatedButton.styleFrom(
                  primary: gButtonOffColor,
                  minimumSize: Size(getScreenWidth(context), 60),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "로그인",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ClipRRect _buildOauthLogin(String imagePath) {
    return ClipRRect(
      // ignore: sort_child_properties_last
      child: Image.asset(
        "${imagePath}",
        width: 60,
        height: 60,
      ),
      borderRadius: BorderRadius.circular(30),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 1,
      centerTitle: true,
      title: Text(
        "로그인",
        style: TextStyle(color: Colors.black),
      ),
      leading: IconButton(
          icon: Icon(
            CupertinoIcons.xmark,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          }),
    );
  }

  void scrollAnimate() {
    Future.delayed(Duration(milliseconds: 600), () {
      scrollController.animateTo(MediaQuery.of(context).viewInsets.bottom,
          duration: Duration(microseconds: 100), // 0.1초 이후 field가 올라간다.
          curve: Curves.easeIn); //Curves - 올라갈때 애니메이션
    });
  }
}
