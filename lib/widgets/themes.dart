import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class themes {
  static ThemeData Ligththeme(BuildContext context) => ThemeData(
      primarySwatch: Colors.green,
      fontFamily: GoogleFonts.lato().fontFamily,
      appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          toolbarTextStyle: Theme.of(context).textTheme.bodyText2,
          titleTextStyle: Theme.of(context).textTheme.headline6));

  static ThemeData Darktheme(BuildContext context) => ThemeData(brightness: Brightness.light, primarySwatch: Colors.deepPurple);
}
