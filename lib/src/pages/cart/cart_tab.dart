import 'package:flutter/material.dart';
import 'package:grocerstore/src/config/ap_data.dart';
import 'package:grocerstore/src/config/custom_color.dart';
import 'package:grocerstore/src/pages/cart/components/cart_tile.dart';
import 'package:grocerstore/src/services/utils_services.dart';

import '../../models/cart_item_model.dart';

class CartTab extends StatefulWidget {
  CartTab({super.key});

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  final UtilsServices utilsServices = UtilsServices();
  void removeItemFromCart(CartItemModel cartItemModel) {
    setState(() {
      cartitem.remove(cartItemModel);
    });
  }
  double carTotalPrice(){
    double total = 0;
    for(var item in cartitem){
      total +=  item.totalPrice();
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Carrinho"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartitem.length,
              itemBuilder: (_, index) {
                return CartTile(
                  cartitem: cartitem[index],
                  remove: removeItemFromCart
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 3,
                      spreadRadius: 2)
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Total Geral",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                Text(
                  utilsServices.priceToCurrency(carTotalPrice()),
                  style: TextStyle(
                    fontSize: 23,
                    color: CustomColor.customSwatColor,
                  ),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: CustomColor.customSwatColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18))),
                    onPressed: () async {
                      bool? result = await  showBorderConfirmation();
                      print(result);
                    },
                    child: const Text(
                      "Concluir Pedido",
                      style: TextStyle(fontSize: 18),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<bool?> showBorderConfirmation() {
    return showDialog<bool>(context: context, builder: (context){
      return AlertDialog(title: Text("Confirmação"),
        content: Text("Deseja realmente Concluir o pedido?"),
      actions: [
        TextButton(onPressed: (){
          Navigator.of(context).pop(false);
        }, child: Text("Não")),
        ElevatedButton(onPressed: (){
          Navigator.of(context).pop(true);
        }, child: Text("Sim"))

      ],);
    });
  }
}
