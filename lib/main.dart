import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter App",
      home: Material(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            // ignore: avoid_unnecessary_containers
            child: Container(
              child: const Text(
                "hello welcome home",
                style: TextStyle(
                    fontSize: 20, fontFamily: 'italic', color: Colors.blue),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
