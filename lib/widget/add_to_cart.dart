import 'package:flutter/material.dart';
import '../models/deals_model.dart';
import '../utils/constant.dart';

class AddToCart {
  static void addtocart(DealsModel data, BuildContext context) {
    bool contains = itemsOnCart.contains(data);

    if (contains == true) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          "Item already in cart",
          style: TextStyle(color: Colors.red),
        ),
        duration: Duration(milliseconds: 1000),
        backgroundColor: Colors.white,
      ));
    } else {
      itemsOnCart.add(data);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          "Item added to cart",
          style: TextStyle(color: Colors.green),
        ),
        duration: Duration(milliseconds: 1000),
        backgroundColor: Colors.white,
      ));
    }
  }
}
