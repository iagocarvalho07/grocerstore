import 'package:flutter/material.dart';
import 'package:grocerstore/src/config/custom_color.dart';
import 'package:grocerstore/src/models/itens_model.dart';
import 'package:grocerstore/src/pages/products/products_screen.dart';
import 'package:grocerstore/src/services/utils_services.dart';

class ItemTile extends StatelessWidget {
  ItemTile({super.key, required this.item});

  final ItemModel item;

  UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (c) {
                  return ProductsScreen(
                    item: item,
                  );
                },
              ),
            );
          },
          child: Card(
            elevation: 1,
            shadowColor: Colors.green.shade600,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                // image
                Expanded(
                  child: Hero(
                    tag: item.imgUrl,
                    child: Image.asset(
                      item.imgUrl,
                    ),
                  ),
                ),
                // nome
                Text(
                  item.itemName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      utilsServices.priceToCurrency(item.price),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: CustomColor.customSwatColor,
                      ),
                    ),
                    Text(
                      "/${item.unit},",
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 12,
                      ),
                    )
                  ],
                )

                //preco -unidade
              ],
            ),
          ),
        ),
        Positioned(
            top: 4,
            right: 4,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                    color: CustomColor.customSwatColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        topRight: Radius.circular(20))),
                height: 40,
                width: 35,
                child: Icon(Icons.add_shopping_cart_outlined),
              ),
            ))
      ],
    );
  }
}
