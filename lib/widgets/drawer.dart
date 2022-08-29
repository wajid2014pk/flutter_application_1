import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _imageurl =
        "https://w7.pngwing.com/pngs/595/79/png-transparent-dart-programming-language-flutter-object-oriented-programming-flutter-logo-class-fauna-bird.png";
    return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: [
        DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountEmail: const Text(
                  "Wajid2014pk@gmail.com",
                  textScaleFactor: 1.15,
                ),
                accountName: const Text(
                  "Wajid Ali",
                  textScaleFactor: 1.15,
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(_imageurl),
                ))),
        ListTile(
          leading: Icon(CupertinoIcons.home),
          title: Text(
            "Home",
            textScaleFactor: 1.3,
          ),
        ),
        ListTile(
          leading: Icon(CupertinoIcons.profile_circled),
          title: Text(
            "Profile",
            textScaleFactor: 1.3,
          ),
        ),
        ListTile(
          leading: Icon(CupertinoIcons.settings),
          title: Text(
            "Settings",
            textScaleFactor: 1.3,
          ),
        ),
        ListTile(
          leading: Icon(CupertinoIcons.question_circle),
          title: Text(
            "Help",
            textScaleFactor: 1.3,
          ),
        ),
      ]),
    );
  }
}
