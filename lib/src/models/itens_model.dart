class ItemModel {
  late String itemName;
  late String imgUrl;
  late String unit;
  late double price;
  late String description;

  ItemModel({
    required this.description,
    required this.imgUrl,
    required this.itemName,
    required this.unit,
    required this.price,
  });
}
