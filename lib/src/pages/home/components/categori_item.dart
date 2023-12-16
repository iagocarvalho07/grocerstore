import 'package:flutter/material.dart';
import 'package:grocerstore/src/config/custom_color.dart';

class CategoriItem extends StatelessWidget {
  String categorie;
  bool isSelected;
  final VoidCallback onPressed;

  CategoriItem({
    super.key,
    required this.categorie,
    required this.isSelected, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Align(
        alignment: Alignment.center,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 6),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color:
                    isSelected ? CustomColor.customSwatColor : Colors.transparent),
            child: Text(
              categorie,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: isSelected ? 16 : 14,
              ),
            )),
      ),
    );
  }
}
