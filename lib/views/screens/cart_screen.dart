
import 'package:flutter/material.dart';
import 'package:lesson_64/controllers/cart_controller.dart';
import 'package:lesson_64/models/product_model.dart';
import 'package:lesson_64/views/screens/show_screen.dart';
import 'package:provider/provider.dart';

import '../widgets/cart_item.dart';
import 'home_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int currentIndex = 0;

  List screens = [ProductsScreen(), CartScreen(), PurchasedItemsScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Savatcha",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Consumer<CartController>(
        builder: (context, cartController, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                cartController.cart.products.isEmpty
                    ? const Center(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      "Savatcha bo'sh, mahsulot qo'shing",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                )
                    : ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: cartController.cart.products.length,
                  itemBuilder: (ctx, index) {
                    final productEntry =
                    cartController.cart.products.entries.toList()[index];
                    final product = productEntry.value['product'] as Product;
                    final quantity = productEntry.value['amount'] as int;

                    return ChangeNotifierProvider<Product>.value(
                      value: product,
                      child: Dismissible(
                        key: Key(product.id.toString()),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          final snackBar = SnackBar(
                            duration: const Duration(seconds: 1),
                            content: Text(
                              "${product.title} savatdan o'chirildi",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            action: SnackBarAction(
                              backgroundColor: Colors.grey,
                              label: 'Undo',
                              onPressed: () {
                                cartController.addToCart(product);
                              },
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          cartController.remove(product.id.toString());
                        },
                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: const Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                        child: CartItem(
                          product: product,
                          quantity: quantity,
                        ),
                      ),
                    );
                  },
                ),
                BottomAppBar(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$${cartController.cart.totalPrice}",
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple,
                          ),
                          onPressed: cartController.cart.totalPrice == 0
                              ? null
                              : () {
                            cartController.purchaseItems();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                duration: const Duration(seconds: 1),
                                backgroundColor: Colors.grey[700],
                                content: const Text(
                                  'Purchased!',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            );
                          },
                          child: const Text(
                            "Purchase",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
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

