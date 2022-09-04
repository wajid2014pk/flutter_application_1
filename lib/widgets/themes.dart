import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  static ThemeData Ligththeme(BuildContext context) => ThemeData(
      primarySwatch: Colors.green,
      fontFamily: GoogleFonts.poppins().fontFamily,
      appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: const IconThemeData(color: Colors.black),
          toolbarTextStyle: Theme.of(context).textTheme.bodyText2,
          titleTextStyle: Theme.of(context).textTheme.headline6));

  static ThemeData Darktheme(BuildContext context) =>
      ThemeData(brightness: Brightness.light, primarySwatch: Colors.deepPurple);

  static Color creamColor = const Color(0xfff5f5f5);
  static Color blusishColor = const Color(0xff403b58);
}
