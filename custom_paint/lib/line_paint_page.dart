import 'package:flutter/material.dart';

class LinePaintPage extends StatelessWidget {
  const LinePaintPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.white,
          child: CustomPaint(
            foregroundPainter: SingleLinePainter(),
          ),
        ),
      ),
    );
  }
}

class SingleLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 50
      ..strokeCap = StrokeCap.round;
    final paintEdge = Paint()
      ..color = Colors.red
      ..strokeWidth = 15;

    final centerp1 = Offset(size.width * 0.2, size.height / 2);
    final centerp2 = Offset(size.width * 0.8, size.height / 2);

    final edge1 = Offset(0, 0);
    final edge2 = Offset(size.width, 0);
    final edge3 = Offset(size.width, size.height);
    final edge4 = Offset(0, size.height);

    canvas.drawLine(centerp2, centerp2, paint);
    // canvas.dra

    canvas.drawLine(edge1, edge2, paintEdge);
    canvas.drawLine(edge2, edge3, paintEdge);
    canvas.drawLine(edge3, edge4, paintEdge);
    canvas.drawLine(edge4, edge1, paintEdge);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
