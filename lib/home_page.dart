import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:flutter_application_1/widgets/home_widgets/catalog_header.dart';
import 'package:flutter_application_1/widgets/home_widgets/catalog_list.dart';
import 'dart:convert';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

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
    return Scaffold(
      backgroundColor: Themes.creamColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, ScreenRoutes.cartPage),
        backgroundColor: Colors.blueGrey,
        child: const Icon(CupertinoIcons.cart),
      ),
      body: SafeArea(
          child: Container(
              padding: Vx.m16,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CatalogHeader(),
                    if (CatalogModel.items.isNotEmpty)
                      const CatalogList().expand()
                    else
                      const CircularProgressIndicator().centered().expand(),
                  ]))),
    );
  }
}

// class CatalogHeader extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
//       "Catalog App".text.color(Colors.blueGrey).xl4.bold.make(),
//       "Trending Products".text.xl2.make()
//     ]);
//   }
// }

// class CatalogList extends StatelessWidget {
//   const CatalogList({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         shrinkWrap: true,
//         itemCount: CatalogModel.items.length,
//         itemBuilder: ((context, index) {
//           final catalog = CatalogModel.items[index];
//           return CatalogItem(catalog: catalog);
//         }));
//   }
// }

// class CatalogItem extends StatelessWidget {
//   final Item catalog;

//   const CatalogItem({Key? key, required this.catalog}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return VxBox(
//         child: Row(
//       children: [
//         CatalogImage(image: catalog.image),
//         Expanded(
//             child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             catalog.name.text.lg.bold.color(Colors.blueGrey).make(),
//             catalog.desc.text.textStyle(context.captionStyle).make(),
//             Expanded(
//               child: ButtonBar(
//                 alignment: MainAxisAlignment.spaceBetween,
//                 buttonPadding: EdgeInsets.zero,
//                 children: [
//                   "\$${catalog.price}".text.lg.bold.make(),
//                   ElevatedButton(
//                       onPressed: () {},
//                       style: ButtonStyle(
//                           backgroundColor:
//                               MaterialStateProperty.all(Colors.blueGrey),
//                           shape:
//                               MaterialStateProperty.all(const StadiumBorder())),
//                       child: "Buy".text.make())
//                 ],
//               ).pOnly(right: 8.0, bottom: 8.0),
//             )
//           ],
//         ))
//       ],
//     )).white.rounded.square(100).make().py16();
//   }
// }

// class CatalogImage extends StatelessWidget {
//   final String image;

//   const CatalogImage({Key? key, required this.image}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Image.network(
//       image,
//     ).box.rounded.color(Themes.creamColor).make().p16().w40(context);
//   }
// }
