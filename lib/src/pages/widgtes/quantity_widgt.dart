import 'package:flutter/material.dart';
import 'package:grocerstore/src/config/custom_color.dart';

class QuantityWidget extends StatelessWidget {
  final int value;
  final String suffixText;
  final Function(int Quantity) result;
  final bool isRemovable;

  const QuantityWidget(
      {super.key,
      required this.value,
      required this.suffixText,
      required this.result,
      this.isRemovable = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            spreadRadius: 1,
            blurRadius: 2,
          )
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _QuantityButtom(
            color:!isRemovable || value > 1 ? Colors.grey : Colors.red,
            icon: !isRemovable || value > 1 ? Icons.remove : Icons.delete_forever,
            onPressed: () {
              if (value == 1 &&  !isRemovable) return;
              int resultCount = value - 1;
              result(resultCount);
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Text(
              "$value$suffixText",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          _QuantityButtom(
            color: CustomColor.customSwatColor,
            icon: Icons.add,
            onPressed: () {
              int resultCount = value + 1;
              result(resultCount);
            },
          ),
        ],
      ),
    );
  }
}

class _QuantityButtom extends StatelessWidget {
  final Color color;
  final IconData icon;
  final VoidCallback onPressed;

  const _QuantityButtom(
      {super.key,
      required this.color,
      required this.icon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: onPressed,
        child: Ink(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 16,
          ),
        ),
      ),
    );
  }
}
