import 'package:flutter/material.dart';
import 'package:lesson_64/controllers/cart_controller.dart';
import 'package:lesson_64/models/product_model.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import 'cart_screen.dart';
import 'home_screen.dart';

class PurchasedItemsScreen extends StatefulWidget {
  const PurchasedItemsScreen({super.key});

  @override
  State<PurchasedItemsScreen> createState() => _PurchasedItemsScreenState();
}

class _PurchasedItemsScreenState extends State<PurchasedItemsScreen> {
  int currentIndex = 0;
  List screens = [ProductsScreen(), CartScreen(), PurchasedItemsScreen()];

  @override
  Widget build(BuildContext context) {
    final purchasedItems = Provider.of<CartController>(context).purchasedItems;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Buyurtmalar',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: purchasedItems.isEmpty
          ? const Center(
              child: Text(
                'Buyurtmalar mavjud emas.',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: purchasedItems.length,
              itemBuilder: (context, index) {
                final productEntry = purchasedItems.entries.toList()[index];
                final product = productEntry.value['product'] as Product;
                final date = productEntry.value['date'] as DateTime;

                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        "assets/images/img.png",
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      product.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '\$${product.price}',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Purchased on: ${DateFormat.yMMMd().format(date)}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
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
