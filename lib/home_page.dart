import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  int days = 20;
  String name = "Wajid Ali";

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Catalog App ",
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          // ignore: avoid_unnecessary_containers
          child: Container(
            child: Text(
              "Welcome home after $days days from $name",
              style: const TextStyle(
                  fontSize: 20, fontFamily: 'italic', color: Colors.blue),
            ),
          ),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
