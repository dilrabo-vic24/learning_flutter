import 'package:flutter/material.dart';

class ManuelExplicitAnimation extends StatefulWidget {
  const ManuelExplicitAnimation({super.key});

  @override
  State<ManuelExplicitAnimation> createState() =>
      _ManuelExplicitAnimationState();
}

class _ManuelExplicitAnimationState extends State<ManuelExplicitAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this);

    _animation = Tween<double>(begin: 100.0, end: 200.0).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            if (_controller.status == AnimationStatus.completed) {
              _controller.reverse();
            } else {
              _controller.forward();
            }
          },
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Container(
                width: _animation.value,
                height: _animation.value,
                color: Colors.purple,
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
