import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade200,
      appBar: AppBar(title: const Text("First Page"), centerTitle: true),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(scaleRoute(Page2()));
          },
          child: const Text("Navigate Screen2"),
        ),    
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      appBar: AppBar(
        title: const Text("Second Page"),
        centerTitle: true,
      ),
    );
  }
}

PageRouteBuilder scaleRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = const Offset(1.0, 0.0);
      var end = Offset.zero;
      var tween =
          Tween(begin: begin, end: end).chain(CurveTween(curve: Curves.ease));

      var offsetAnimation = animation.drive(tween);

      return FadeTransition(
          opacity: animation,
          child: SlideTransition(position: offsetAnimation, child: child));
    },
  );
}
