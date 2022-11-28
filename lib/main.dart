import 'package:finalproject_front/pages/main_page.dart';
import 'package:finalproject_front/pages/sign/join_division_page/join_division_page.dart';
import 'package:finalproject_front/pages/sign/join_page/join_page.dart';
import 'package:finalproject_front/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/main",
      routes: {
        "/main": (context) => MainPage(),
        "/login": (context) => JoinPage(),
        "/join": (context) => JoinPage(),
        "/joinDivision": (context) => JoinDivisionPage(),
      },
      theme: theme(),
    );
  }
}
