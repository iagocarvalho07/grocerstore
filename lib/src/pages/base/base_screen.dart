import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocerstore/src/pages/cart/cart_tab.dart';
import '../home/home_tab.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final pageController = PageController(

  );
  int curretIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          HomeTab(),
          CartTab(),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.purple,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              curretIndex = index;
              pageController.jumpToPage(index);
            });
          },
          currentIndex: curretIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.green,
          selectedItemColor: Colors.white,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: "Carrinho"),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: "Pedidos"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
          ],),
    );
  }
}
