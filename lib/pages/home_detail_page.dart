import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.xl3.bold.make(),
            ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blueGrey),
                        shape:
                            MaterialStateProperty.all(const StadiumBorder())),
                    child: "Add to cart".text.xl.make())
                .wh(140, 50)
          ],
        ).p12(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: Image.network(
              catalog.image,
              height: 200,
              //scale: 4.0,
            ),
          ).p20(),
          Expanded(
              child: VxArc(
            height: 25,
            arcType: VxArcType.CONVEY,
            edge: VxEdge.TOP,
            child: Container(
              color: Colors.white,
              width: context.screenWidth,
              child: Column(
                children: [
                  catalog.name.text.lg.bold.xl4
                      .color(Colors.blueGrey)
                      .make()
                      .p12(),
                  catalog.desc.text.xl.textStyle(context.captionStyle).make(),
                  "Ipsum amet kasd duo sed nonumy ea et accusam tempor. Consetetur eirmod stet ut elitr consetetur ipsum, ipsum sed erat."
                      .text
                      .textStyle(context.captionStyle)
                      .lg
                      .align(TextAlign.justify)
                      .make()
                      .p16()
                ],
              ).py32(),
            ),
          ))
        ]),
      ),
    );
  }
}
