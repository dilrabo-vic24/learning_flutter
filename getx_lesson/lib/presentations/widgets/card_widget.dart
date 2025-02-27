import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx_lesson/controllers/card_controller.dart';

class CardWidget extends StatelessWidget {
  final CardController cardController;
  const CardWidget({super.key, required this.cardController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Card widget"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () {
                return ListView.builder(
                  itemCount: cardController.cardItems.length,
                  itemBuilder: (context, index) {
                    final product = cardController.cardItems[index];
                    return ListTile(
                      title: Text(product.name),
                      subtitle: Text("\$${product.price}"),
                      trailing: IconButton(
                        onPressed: () {
                          cardController.removeFromCard(product);
                        },
                        icon: Icon(Icons.remove_circle_outline),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Obx(
            () {
              return Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Total: ${cardController.totalAmount.value.toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
