import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_lesson/controllers/cart_controller.dart';
import 'package:getx_lesson/controllers/product_controler.dart';
import 'package:getx_lesson/data/model/product_model.dart';
import 'package:getx_lesson/presentations/screens/cart_screen.dart';

class ProductScreen extends StatelessWidget {
  final ProductControler productsViewModel = Get.put(ProductControler());
  final CartController cartViewModel = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Products',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () => Get.to(() => CartScreen()),
          ),
        ],
      ),
      body: Obx(() {
        if (productsViewModel.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        return GridView.builder(
          padding: EdgeInsets.all(16),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: productsViewModel.products.length,
          itemBuilder: (context, index) {
            final product = productsViewModel.products[index];
            return buildProductCard(product);
          },
        );
      }),
    );
  }

  Widget buildProductCard(ProductModel product) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              ),
              width: double.infinity,
              child: Center(child: Image.network(product.imageUrl!)),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      cartViewModel.addToCart(product);
                      Get.snackbar(
                        'Added to Cart',
                        '${product.name} has been added to your cart',
                        snackPosition: SnackPosition.BOTTOM,
                        duration: Duration(seconds: 2),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                    ),
                    child: Text(
                      'Add to Cart',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
