import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocerstore/src/config/custom_color.dart';
import 'package:grocerstore/src/pages/home/components/item_tile.dart';

import '../../config/ap_data.dart';
import 'components/categori_item.dart';

class HomeTab extends StatefulWidget {
  HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List categories = ["Vegetais", "frutas", "Verduras", "legumes", "graõs "];

  String selectedCategories = "Vegetais";

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
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 40,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return CategoriItem(
                        onPressed: () {
                          setState(() {
                            selectedCategories = categories[index];
                          });
                        },
                        categorie: categories[index],
                        isSelected: categories[index] == selectedCategories);
                  },
                  separatorBuilder: (_, index) => const SizedBox(
                        width: 10,
                      ),
                  itemCount: categories.length),
            ),
          ),
          Expanded(
            child: GridView.builder(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 9 / 11.5),
                itemCount: items.length,
                itemBuilder: (_, index) {
                  return ItemTile(item: items[index],);
                }),
          )
        ],
      ),
    );
  }
}
