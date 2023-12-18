import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocerstore/src/config/custom_color.dart';
import 'package:grocerstore/src/models/itens_model.dart';
import 'package:grocerstore/src/pages/widgtes/quantity_widgt.dart';
import 'package:grocerstore/src/services/utils_services.dart';

class ProductsScreen extends StatefulWidget {
  ProductsScreen({super.key, required this.item});

  final ItemModel item;

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  UtilsServices utilsServices = UtilsServices();

  int CartItemQuantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(230),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Hero(
                  tag: widget.item.imgUrl,
                  child: Image.asset(
                    widget.item.imgUrl,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(
                        50,
                      ),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade600,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              widget.item.itemName,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 27,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            child: QuantityWidget(
                              suffixText: widget.item.unit,
                              value: CartItemQuantity,
                              result: (int Quantity) {
                                setState(() {
                                  CartItemQuantity = Quantity;
                                });
                              },
                            ),
                          )
                        ],
                      ),
                      Text(
                        utilsServices.priceToCurrency(widget.item.price),
                        style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: CustomColor.customSwatColor),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: SingleChildScrollView(
                            child: Text(
                              widget.item.description,
                              style: const TextStyle(height: 1.5),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 55,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green),
                          onPressed: () {},
                          label: const Text(
                            "ADD ao Carrinho",
                            style: TextStyle(color: Colors.white),
                          ),
                          icon: Icon(Icons.add_shopping_cart_outlined),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Positioned(
            left: 10,
            top: 10,
            child: SafeArea(
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back_ios))),
          )
        ],
      ),
    );
  }
}
