import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: "Cart".text.make(),
      ),
      body: Column(
        children: [_CartList().p32().expand(), const Divider(), _CartTotal()],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${_cart.totalPrice}"
              .text
              .xl4
              .
              //color(context.accentColor)
              make(),
          30.widthBox,
          ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: "Buying not available".text.make(),
                    ));
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(context.accentColor)),
                  child: "BUY".text.lg.make())
              .w24(context)
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget{
  // final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty
        ? "Cart is empty".text.xl2.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: ((context, index) => ListTile(
                  leading: const Icon(Icons.done),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove_circle_outline),
                    onPressed: () {
                      _cart.remove(_cart.items[index]);
                      //setState(() {});
                    },
                  ),
                  title: _cart.items[index].name.text.make(),
                )));
  }
}
