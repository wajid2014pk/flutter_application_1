import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_application_1/home_page.dart';
import 'package:flutter_application_1/loginScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter App",
      //home: HomePage(),
      themeMode: ThemeMode.light,
      theme: ThemeData(
          primarySwatch: Colors.green,
          fontFamily: GoogleFonts.lato().fontFamily),
      darkTheme: ThemeData(
          brightness: Brightness.light, primarySwatch: Colors.deepPurple),
      routes: {
        "/": (context) => LoginScreen(),
        "/home": (context) => HomePage(),
        "/login": (context) => LoginScreen()
      },
    );
  }
}
