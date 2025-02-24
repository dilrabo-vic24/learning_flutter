import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:dio_library_lesson/controller/product_provider.dart';
import 'package:dio_library_lesson/screens/shimmer_widget.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    Provider.of<ProductProvider>(context, listen: false).fetchProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Products',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Consumer<ProductProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return ShimmerWidget();
          } else if (provider.errorMessage.isNotEmpty) {
            return Center(child: Text("Error: ${provider.errorMessage}"));
          }

          log("lenght: ${provider.products.length.toString()}");
          return Padding(
            padding: EdgeInsets.all(15),
            child: ListView.builder(
              itemCount: provider.products.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Column(
                    children: [
                      Image.network(
                        "https://e-commerce.birnima.uz${provider.products[index].image![0]}",
                        width: 250,
                        height: 250,
                      ),
                      Text(
                        provider.products[index].name!,
                        style: TextStyle(fontSize: 28),
                      ),
                      Text(
                        "\$${provider.products[index].price.toString()}",
                        style: TextStyle(fontSize: 28),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}