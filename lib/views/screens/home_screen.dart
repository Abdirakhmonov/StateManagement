import 'dart:math';
import 'package:flutter/material.dart';
import 'package:lesson_64/models/product_model.dart';
import 'package:lesson_64/views/screens/cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Catalog",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartScreen()));
              },
              icon: const Icon(Icons.shopping_cart))
        ],
      ),
      body: ListView.builder(
        itemCount: 30,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.accents[Random().nextInt(16)],
            ),
            title: Text(
              product.title,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
            subtitle: Text(
              "${product.price}\$",
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            trailing: TextButton(
              onPressed: () {},
              child: const Text("ADD"),
            ),
          );
        },
      ),
    );
  }
}
