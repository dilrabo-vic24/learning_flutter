import 'dart:developer';

import 'package:crud_api_lesson/presentation/screens/detail_screen.dart';
import 'package:crud_api_lesson/presentation/widgets/category_products_widget.dart';
import 'package:crud_api_lesson/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsByCategory extends StatelessWidget {
  final String category;
  const ProductsByCategory({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text("Products"),
          ),
        ),
        body: Consumer<ProductProvider>(
          builder: (context, productsProvider, child) {
            if (productsProvider.isloading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            // productsProvider.getProductsByCategory(category: widget.category);
            return Column(
              children: [
                Text(category),
                Expanded(
                  child: ListView.builder(
                    itemCount: productsProvider.productsByCategory!.length ?? 0,
                    itemBuilder: (context, index) {
                      // log("len = ${productsProvider.productsByCategory}");

                      final productByCategory =
                          productsProvider.productsByCategory![index];

                      return CategoryProductsWidget(
                        onTap: () async {
                          log(productByCategory.id.toString());
                          productsProvider.getProductsById(
                            id: productByCategory.id!,
                          );
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsScreen(
                                id: productByCategory.id!,
                              ),
                            ),
                          );
                        },
                        imageUrl: productByCategory.image.toString(),
                        brand: productByCategory.brand!,
                        model: productByCategory.model!,
                        price: productByCategory.price!,
                        check: productByCategory.popular ?? false,
                        color: productByCategory.color.toString() == "null"
                            ? "Unknown"
                            : productByCategory.color.toString(),
                        id: productByCategory.id!,
                      );
                    },
                  ),
                )
              ],
            );
          },
        ));
  }
}
