import 'package:crud_api_lesson/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatelessWidget {
  final int id;
  DetailsScreen({super.key, required this.id});
  final brandController = TextEditingController();
  final modelController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Product Details"),
        ),
      ),
      body: SingleChildScrollView(
        child: Consumer<ProductProvider>(
          builder: (context, productProvider, child) {
            if (productProvider.isloading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {}
            return Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(productProvider.productData.image!),
                  Text(
                    productProvider.productData.model.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    productProvider.productData.brand.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    productProvider.productData.title.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(productProvider.productData.description.toString()),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(130, 40)),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Edit product"),
                                  content: Padding(
                                    padding: EdgeInsets.all(20),
                                    child: SizedBox(
                                      height: 200,
                                      child: Column(
                                        children: [
                                          TextField(
                                            controller: brandController,
                                            decoration: const InputDecoration(
                                                hintText: "New brand",
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                )),
                                          ),
                                          const SizedBox(height: 10),
                                          TextField(
                                            controller: modelController,
                                            decoration: const InputDecoration(
                                                hintText: "New model",
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                )),
                                          ),
                                          const SizedBox(height: 10),
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  fixedSize: Size(200, 50)),
                                              onPressed: () {
                                                if (brandController
                                                        .text.isEmpty ||
                                                    modelController
                                                        .text.isEmpty) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                          const SnackBar(
                                                    content: Text(
                                                        "Please, enter new model and brand"),
                                                    backgroundColor: Colors.red,
                                                  ));
                                                } else {
                                                  productProvider.updateProduct(
                                                      id: id,
                                                      model: modelController
                                                          .text
                                                          .trim(),
                                                      brand: brandController
                                                          .text
                                                          .trim());
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                          const SnackBar(
                                                    content:
                                                        Text("Product updated"),
                                                    backgroundColor:
                                                        Colors.green,
                                                  ));
                                                  Navigator.pop(context);
                                                }
                                              },
                                              child: const Text("Update"))
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: const Text("Update")),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(130, 40)),
                          onPressed: () {
                            productProvider.deleteProduct(id: id);
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Product deleted"),
                              backgroundColor: Colors.green,
                            ));
                          },
                          child: Text("Delete"))
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
