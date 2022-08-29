class catalogmodel {
 static final items = [
    Item(
      id: 001,
      name: "Iphone 13 pro",
      dis: "Apple's iphone 13th generation ",
      price: 1100,
      color: "Blue",
      urlImage:
          "https://www.apple.com/v/iphone-13-pro/a/images/overview/design/water_resistant__gnhxpuloslay_large.jpg")

  ];
}

class Item {
  final int id;
  final String name;
  final String dis;
  final num price;
  final String color;
  final String urlImage;

  Item(
      {required this.id,
      required this.color,
      required this.name,
      required this.dis,
      required this.price,
      required this.urlImage});
}