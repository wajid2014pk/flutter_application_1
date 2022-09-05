import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      "Catalog App".text.color(Colors.blueGrey).xl4.bold.make(),
      "Trending Products".text.xl2.make()
    ]);
  }
}