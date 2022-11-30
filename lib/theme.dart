import 'package:flutter/material.dart';
// import 'package:google_fonts/noto_sans_kr.dart;

TextTheme textTheme() {
  return TextTheme(
    headlineLarge: TextStyle(
        fontFamily: 'NotoSansKR', fontSize: 20.0, color: Colors.black),
    headlineMedium: TextStyle(
        fontFamily: 'NotoSansKR', fontSize: 18.0, color: Colors.black),
    subtitle1:
        TextStyle(fontFamily: 'NotoSansKR', fontSize: 16, color: Colors.black),
    bodyLarge:
        TextStyle(fontFamily: 'NotoSansKR', fontSize: 14, color: Colors.black),
    bodyMedium: TextStyle(fontFamily: 'NotoSansKR', fontSize: 12),
    bodySmall: TextStyle(fontFamily: 'NotoSansKR', fontSize: 10),
  );
}

ThemeData theme() {
  return ThemeData(
    fontFamily: "NotoSansKR",
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 1,
    ),
    // primaryColor: Color(0xff4880ED),
  );
}
