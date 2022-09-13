import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:flutter_application_1/widgets/home_widgets/catalog_header.dart';
import 'package:flutter_application_1/widgets/home_widgets/catalog_list.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //int days = 20;

  // String name = "Wajid Ali";

  final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");

    // final response = await http.get(Uri.parse(url));
    // final catalogJson = response.body.toString();
    final decodedData = jsonDecode(catalogJson);
    var productData = decodedData["products"];

    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
          mutations: const {AddMutation, RemoveMutation},
          builder: (context, _, status) => FloatingActionButton(
                onPressed: () =>
                    Navigator.pushNamed(context, ScreenRoutes.cartPage),
                backgroundColor: Themes.blusishColor,
                child: const Icon(CupertinoIcons.cart),
              ).badge(
                color: Vx.gray500,
                size: 22,
                count: _cart.items.length,
                textStyle: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              )),
      body: SafeArea(
          child: Container(
              padding: Vx.m16,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CatalogHeader(),
                    if (CatalogModel.items.isNotEmpty)
                      const CatalogList().expand()
                    else
                      const CircularProgressIndicator().centered().expand(),
                  ]))),
    );
  }
}
