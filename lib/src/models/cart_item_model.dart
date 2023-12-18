import 'package:grocerstore/src/models/itens_model.dart';

class CartItemModel {
  late ItemModel itemModel;
  int quantity;

  CartItemModel({
    required this.itemModel, required this.quantity
  });

  double totalPrice() => itemModel.price * quantity;
}