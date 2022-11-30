import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// TextTheme textTheme() {
//   return TextTheme(
//     headline1: GoogleFonts.notoSans(
//         fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold),
//     headline2: GoogleFonts.notoSans(fontSize: 18.0, color: Colors.black),
//     headline3: GoogleFonts.notoSans(fontSize: 16.0, color: Colors.black),
//     bodyText1: GoogleFonts.notoSans(fontSize: 16.0, color: Colors.black),
//     bodyText2: GoogleFonts.notoSans(fontSize: 14.0, color: Color(0xff787272)),
//     subtitle1: GoogleFonts.notoSans(
//         fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.bold),
//   );
// }

AppBarTheme appTheme() {
  return AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0.0,
  );
}

TextButtonThemeData textButtonTheme() {
  // textbutton 기본 스타일 초기화
  return TextButtonThemeData(
    style: TextButton.styleFrom(
      minimumSize: Size.zero,
      padding: EdgeInsets.zero,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    ),
  );
}

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: appTheme(),
    textButtonTheme: textButtonTheme(),
  );
}
