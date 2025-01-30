import 'package:flutter/material.dart';

class ExplicitAnimationExample extends StatefulWidget {
  const ExplicitAnimationExample({super.key});

  @override
  State<ExplicitAnimationExample> createState() =>
      _ExplicitAnimationExampleState();
}

class _ExplicitAnimationExampleState extends State<ExplicitAnimationExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _sizeAnimation;
  late Animation<Offset> _positionAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _sizeAnimation = Tween<double>(begin: 50.0, end: 150.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _positionAnimation = Tween<Offset>(
            begin: Offset(-1.0, 0.0), end: Offset(1.0, 0.0))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _colorAnimation = ColorTween(begin: Colors.blue, end: Colors.red)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform.translate(
                      offset: _positionAnimation.value,
                      child: Container(
                          width: _sizeAnimation.value,
                          height: _sizeAnimation.value,
                          decoration: BoxDecoration(
                              color: _colorAnimation.value,
                              shape: BoxShape.circle)));
                })));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
