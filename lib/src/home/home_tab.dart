import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocerstore/src/config/custom_color.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text.rich(TextSpan(
            style: const TextStyle(
              fontSize: 30,
            ),
            children: [
              TextSpan(
                  text: "Green",
                  style: TextStyle(color: CustomColor.customSwatColor)),
              TextSpan(
                  text: "grocer",
                  style: TextStyle(color: CustomColor.customContrastColor)),
            ])),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 15, right: 15),
            child: Badge(
              backgroundColor: CustomColor.customContrastColor,
              label: Text(
                '2',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.shopping_cart),
                color: CustomColor.customSwatColor,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextFormField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  isDense: true,
                  hintText: "Pesquise Aqui",
                  hintStyle:
                      TextStyle(color: Colors.grey.shade400, fontSize: 14),
                  prefixIcon: Icon(
                    Icons.search,
                    color: CustomColor.customContrastColor,
                    size: 21,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(60),
                      borderSide:
                          const BorderSide(width: 0, style: BorderStyle.none))),
            ),
          )
        ],
      ),
    );
  }
}
