import 'package:flutter/material.dart';
import 'package:grocerstore/src/config/custom_color.dart';
import 'package:grocerstore/src/models/itens_model.dart';

class ItemTile extends StatelessWidget {
  const ItemTile({super.key, required this.item});

  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shadowColor: Colors.green.shade600,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          // image
          Expanded(child: Image.asset(item.imgUrl)),
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
                item.price.toString(),
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
    );
  }
}
