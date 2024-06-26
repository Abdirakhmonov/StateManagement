import 'package:flutter/material.dart';
import 'package:lesson_64/views/screens/show_screen.dart';

import 'package:provider/provider.dart';

import '../../controllers/product_controller.dart';
import '../../models/product_model.dart';
import '../widgets/product_container.dart';
import 'cart_screen.dart';

class ProductsScreen extends StatefulWidget {
  ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final productsController = ProductsController();

  int currentIndex = 0;
  List screens = [ProductsScreen(), CartScreen(), PurchasedItemsScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Category",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: GridView.builder(
        itemCount: productsController.list.length,
        itemBuilder: (ctx, index) {
          final product = productsController.list[index];
          return ChangeNotifierProvider<Product>.value(
            value: product,
            builder: (context, child) {
              return const ProductItem();
            },
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: .52,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => screens[index]));
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.category), label: "Market"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(
              icon: Icon(Icons.monetization_on), label: "Orders")
        ],
      ),
    );
  }
}
