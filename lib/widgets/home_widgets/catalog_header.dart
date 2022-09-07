import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      "Catalog App"
          .text
          //.color(context.accentColor)
          .xl4
          .bold
          .make(),
      "Trending Products"
          .text
          .
          //color(context.accentColor).
          xl2
          .make()
    ]);
  }
}
