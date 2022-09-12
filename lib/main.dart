import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/cart_page.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:flutter_application_1/home_page.dart';
import 'package:flutter_application_1/loginScreen.dart';
import 'package:velocity_x/velocity_x.dart';

import 'core/store.dart';

void main() {
  runApp(VxState(store: MyStore(), child: const MyApp()));
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
      theme: Themes.Ligththeme(context),
      darkTheme: Themes.Darktheme(context),
      initialRoute: ScreenRoutes.homeRoute,
      routes: {
        "/": (context) => const LoginScreen(),
        ScreenRoutes.homeRoute: (context) => const HomePage(),
        ScreenRoutes.loginRoute: (context) => const LoginScreen(),
        ScreenRoutes.cartPage: (context) => const CartPage()
      },
    );
  }
}
