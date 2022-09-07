import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/cart_page.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:flutter_application_1/home_page.dart';
import 'package:flutter_application_1/loginScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter App",
      //home: HomePage(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: Themes.Darktheme(context),
      darkTheme: Themes.Darktheme(context),
      initialRoute: ScreenRoutes.loginRoute,
      routes: {
        "/": (context) => LoginScreen(),
        ScreenRoutes.homeRoute: (context) => HomePage(),
        ScreenRoutes.loginRoute: (context) => LoginScreen(),
        ScreenRoutes.cartPage: (context) => CartPage()
      },
    );
  }
}
