import 'package:flutter/material.dart';

class ResultQuestion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 120, right: 20),
      child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            color: Colors.orange,
          ),
          child: Text('Qanday qarshi kurashish mumkin')),
    );
  }
}
