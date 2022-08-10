import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  int days = 20;
  String name = "Wajid Ali";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Catalog App Pra",
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
                  fontSize: 18, fontFamily: 'italic', color: Colors.black87),
            ),
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}
