import 'package:finalproject_front/dto/request/auth_req_dto.dart';
import 'package:finalproject_front/pages/auth/components/join_custom_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:logger/logger.dart';

class JoinPage extends StatefulWidget {
  JoinPage({required this.role, super.key});

  State<JoinPage> createState() => _JoinPageState();

  JoinReqDto joinReqDto = JoinReqDto.single();
  String role;
}

class _JoinPageState extends State<JoinPage> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = new ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: JoinCustomForm(scrollAnimate, role: widget.role, joinReqDto: widget.joinReqDto),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 1,
      centerTitle: true,
      title: Text(
        "회원가입",
        style: TextStyle(color: Colors.black),
      ),
      leading: IconButton(
          icon: Icon(
            CupertinoIcons.back,
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
