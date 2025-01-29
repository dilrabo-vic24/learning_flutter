import 'package:crud_api_lesson/presentation/screens/detail_screen.dart';
import 'package:flutter/material.dart';

class CategoryProductsWidget extends StatelessWidget {
  final String imageUrl;
  final String brand;
  final String model;
  final int price;
  final bool check;
  final String color;
  final int id;
  final Function() onTap;
  const CategoryProductsWidget({
    super.key,
    required this.imageUrl,
    required this.brand,
    required this.model,
    required this.price,
    required this.check,
    required this.color,
    required this.id,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      // onTap: () {
      //   Navigator.push(context,
      //       MaterialPageRoute(builder: (context) => DetailsScreen(id: id)));
      // },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Image.network(
                imageUrl,
                width: 100,
                height: 100,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Text(
                        maxLines: 2,
                        "$brand   $model",
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                  Text("USD ${price.toString()}"),
                  Text("Color: $color"),
                  Text(check ? "Popular" : ""),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
