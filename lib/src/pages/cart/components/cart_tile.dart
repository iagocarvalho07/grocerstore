import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocerstore/src/config/ap_data.dart';
import 'package:grocerstore/src/config/custom_color.dart';
import 'package:grocerstore/src/models/cart_item_model.dart';
import 'package:grocerstore/src/pages/widgtes/quantity_widgt.dart';
import 'package:grocerstore/src/services/utils_services.dart';

class CartTile extends StatefulWidget {
  CartTile({super.key, required this.cartitem, required this.remove,});

  final CartItemModel cartitem;
  final Function(CartItemModel) remove;

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  final UtilsServices utilsServices = UtilsServices();


  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: Image.asset(
          widget.cartitem.itemModel.imgUrl,
          height: 60,
          width: 60,
        ),
        title: Text(
          widget.cartitem.itemModel.itemName,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        trailing: QuantityWidget(
          value: widget.cartitem.quantity,
          suffixText: widget.cartitem.itemModel.unit,
          result: (quantity) {
            setState(() {
              widget.cartitem.quantity = quantity;

              if(quantity == 0){
                widget.remove(widget.cartitem);
              }
            });
          },
          isRemovable: true,
        ),
        subtitle: Text(
          utilsServices.priceToCurrency(widget.cartitem.totalPrice()),
          style: TextStyle(
            color: CustomColor.customSwatColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
