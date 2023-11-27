import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingScreen extends StatelessWidget {
  const SingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(
        children: [
          Expanded(
              child: Container(
            color: Colors.green,
          )),
          Expanded(
              child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(45),
              ),
            ),
          )),
        ],
      ),
    );
  }
}
