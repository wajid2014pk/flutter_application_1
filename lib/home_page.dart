import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'dart:convert';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int days = 20;

  String name = "Wajid Ali";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    var decodedData = jsonDecode(catalogJson);
    print(decodedData);
  }

  @override
  Widget build(BuildContext context) {
    final dummydata = List.generate(20, ((index) => catalogmodel.items[0]));
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Catalog App ",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
            itemCount: dummydata.length,
            itemBuilder: ((context, index) {
              return ItemWidget(
                item: dummydata[index],
              );
            })),
      ),
      drawer: MyDrawer(),
    );
  }
}
