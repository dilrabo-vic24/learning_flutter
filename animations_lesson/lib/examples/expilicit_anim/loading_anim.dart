import 'package:flutter/material.dart';

class LoadingAnimation extends StatefulWidget {
  final double progressNumber;
  final Color progressColor;

  const LoadingAnimation(
      {super.key, required this.progressNumber, required this.progressColor});

  @override
  State<LoadingAnimation> createState() => _LoadingAnimationState();
}

class _LoadingAnimationState extends State<LoadingAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> progressAnimation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 5), vsync: this);

    progressAnimation = Tween<double>(begin: 0, end: widget.progressNumber)
        .animate(animationController);
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: animationController,
          builder: (context, child) {
            return Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 180,
                  height: 180,
                  child: CircularProgressIndicator(
                    strokeWidth: 17,
                    backgroundColor: Colors.grey,
                    color: widget.progressColor,
                    value: progressAnimation.value,
                  ),
                ),
                Text("${progressAnimation.value * 100}%".substring(0, 4)),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          animationController.reverse();
        },
      ),
    );
  }
}
