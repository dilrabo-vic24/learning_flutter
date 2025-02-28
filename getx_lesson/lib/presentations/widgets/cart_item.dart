import 'package:flutter/material.dart';

import 'package:getx_lesson/controllers/cart_controller.dart';
import 'package:getx_lesson/data/model/cart_product.dart';

Widget cartItemCard(
    CartProduct cartProduct, int index, CartController cartController) {
  return Card(
    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Icon(Icons.image, size: 40, color: Colors.grey),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartProduct.product.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 4),
                Text(
                  '\$${cartProduct.product.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.remove_circle_outline),
                onPressed: () => cartController.decreaseQuantity(index),
              ),
              Text(
                '${cartProduct.quantity}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: Icon(Icons.add_circle_outline),
                onPressed: () => cartController.increaseQuantity(index),
              ),
            ],
          ),
          IconButton(
            icon: Icon(Icons.delete_outline, color: Colors.red),
            onPressed: () => cartController.removeFromCart(index),
          ),
        ],
      ),
    ),
  );
}
