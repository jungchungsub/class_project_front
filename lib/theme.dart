import 'package:flutter/material.dart';
// import 'package:google_fonts/noto_sans_kr.dart;

// TextTheme textTheme() {
//   return TextTheme(
//     headline1: NotoSansKR.openSans(fontSize: 20.0, color: Colors.black),
//     headline2: GoogleFonts.openSans(fontSize: 18.0, color: Colors.black),
//     subtitle1: GoogleFonts.openSans(fontSize: 16.0, color: Colors.black),
//     subtitle2: GoogleFonts.openSans(fontSize: 14.0, color: Colors.grey),
//     bodyText1: GoogleFonts.openSans(fontSize: 12.0, color: Colors.black),
//     bodyText2: GoogleFonts.openSans(fontSize: 10.0, color: Colors.black),
//   );
// }

ThemeData theme() {
  return ThemeData(
    // textTheme: textTheme(),
    fontFamily: "NotoSansKR",
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Color(0xff4880ED),
  );
}
