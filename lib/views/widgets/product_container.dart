import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../controllers/cart_controller.dart';
import '../../models/product_model.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset("assets/images/img.png"),
          const Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              product.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Gap(5),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Text(
              product.description,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 13,
              ),
              maxLines: 2,
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  "\$${product.price.toString()}",
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                ),
              ),
              Consumer<CartController>(
                builder: (context, cart, child) {
                  return GestureDetector(
                    onTap: () {
                      final snackBar = SnackBar(
                        duration: const Duration(seconds: 1),
                        content: Text(
                          "${product.title} savatga qo'shildi!",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      cart.addToCart(product);
                    },
                    child: child,
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      size: 20,
                      Icons.shopping_cart,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Gap(10),
        ],
      ),
    );
  }
}
