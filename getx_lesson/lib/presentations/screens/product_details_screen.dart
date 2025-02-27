import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getx_lesson/data/product_model.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductModel products = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(products.name, style: TextStyle(fontSize: 24)),
            SizedBox(height: 10),
            Text(
              "\$${products.price}",
              style: TextStyle(fontSize: 24),
            )
          ],
        ),
      ),
    );
  }
}

//6:19
