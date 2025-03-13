import 'package:flutter/material.dart';

class ResultMainImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 100, right: 20),
      child: Container(
        width: double.infinity,
        height: 230,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/imgs/rasm_1.png"),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            )),
      ),
    );
  }
}
