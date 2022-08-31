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
  //int days = 20;

  // String name = "Wajid Ali";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productData = decodedData["products"];

    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Catalog App ",
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: (CatalogModel.items.isNotEmpty)
              ? Flexible(
                  child: ListView.builder(
                      itemCount: CatalogModel.items.length,
                      itemBuilder: ((context, index) {
                        return ItemWidget(
                          item: CatalogModel.items[index],
                        );
                      })),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ),
        drawer: MyDrawer(),
      ),
    );
  }
}
