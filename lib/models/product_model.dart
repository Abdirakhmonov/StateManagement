import 'package:flutter/cupertino.dart';

class Product extends ChangeNotifier {
  String id;
  String description;
  String title;
  double price;

  Product(
      {required this.id,
      required this.description,
      required this.title,
      required this.price});
}
