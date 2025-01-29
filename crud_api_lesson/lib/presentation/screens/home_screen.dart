import 'package:crud_api_lesson/presentation/screens/products_by_category.dart';
import 'package:crud_api_lesson/presentation/widgets/all_products_card.dart';
import 'package:crud_api_lesson/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Home Screen")),
      ),
      backgroundColor: Colors.grey.shade50,
      body: Consumer<ProductProvider>(
        builder: (context, productProvider, child) {
          final products = productProvider.productsData;
          // log("Kelmayapti kuuu   $products");
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Categories',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    itemCount: products!.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      // log("${data[index].title}");
                      return AllProductsCard(
                        onTap: () async {
                          await productProvider.getProductsByCategory(
                              category: products[index].category.toString());
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductsByCategory(
                                category: products[index].category.toString(),
                              ),
                            ),
                          );
                        },
                        category: "${products[index].category}",
                        image: "${products[index].image}",
                      );
                    },
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
