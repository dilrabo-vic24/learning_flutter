import 'package:flutter/material.dart';

class AnimatedAlignExample extends StatefulWidget {
  const AnimatedAlignExample({super.key});

  @override
  State<AnimatedAlignExample> createState() => _AnimatedAlignExampleState();
}

class _AnimatedAlignExampleState extends State<AnimatedAlignExample> {
  bool isTop = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: GestureDetector(
        onTap: () {
          setState(() {
            isTop = !isTop;
          });
        },
        child: Container(
          color: Colors.grey,
          child: AnimatedAlign(
            alignment: isTop ? Alignment.topCenter : Alignment.topRight,
            duration: Duration(milliseconds: 600),
            child: Container(
              height: 50,
              width: 50,
              color: Colors.blue,
            ),
          ),
        ),
      )),
    );
  }
}
