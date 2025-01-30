import 'package:flutter/material.dart';
import 'dart:math' as math;

class Animation1 extends StatefulWidget {
  const Animation1({super.key});

  @override
  State<Animation1> createState() => _Animation1State();
}

class _Animation1State extends State<Animation1> with TickerProviderStateMixin {
  bool _isReversed = false;
  double _maxTranslation = 650.0;
  double _minTranslation = 0.0;
  late AnimationController controller;
  late Animation<double> _angleAnimation;
  late Animation<double> _positionAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5))
          ..repeat(reverse: true);

    _angleAnimation = Tween<double>(begin: 0, end: 2 * math.pi)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));
    _positionAnimation =
        Tween<double>(begin: _minTranslation, end: _maxTranslation)
            .animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));
  }

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.blue,
            body: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 130, vertical: 50),
              child: AnimatedBuilder(
                  animation: controller,
                  builder: (context, child) {
                    double currentTranslation = _positionAnimation.value;
                    if (!_isReversed &&
                        (currentTranslation >= _maxTranslation)) {
                      _isReversed = true;
                      controller.reverse();
                    } else if (_isReversed &&
                        (currentTranslation <= _minTranslation)) {
                      _isReversed = false;
                      controller.forward();
                    }
                    return Transform.translate(
                        offset: Offset(0, -50 + currentTranslation),
                        child: Transform.rotate(
                            angle: _angleAnimation.value,
                            child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                    color: Colors.pink,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color: Colors.white)))));
                  }),
            )));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
