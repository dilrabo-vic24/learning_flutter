import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:getx_lesson/controllers/product_controler.dart';

class ProductScreen extends StatelessWidget {
  final ProductControler productControler = Get.put(ProductControler());
  ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
      ),
      body: Obx(
        () {
          return ListView.builder(
            itemCount: productControler.products.length,
            itemBuilder: (context, index) {
              final product = productControler.products[index];
 
              return ListTile(
                title: Text(product.name),
                subtitle: Text(product.price.toString()),
                onTap: () {
                  Get.toNamed("/details", arguments: product);
                },
              );
            },
          );
        },
      ),
    );
  }
}
