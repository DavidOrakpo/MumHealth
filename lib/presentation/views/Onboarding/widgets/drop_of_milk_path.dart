import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1

    Paint paintFill0 = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.5000000, size.height * 0.4000000);
    path_0.quadraticBezierTo(size.width * 0.4625000, size.height * 0.5794750,
        size.width * 0.4500000, size.height * 0.6393000);
    path_0.quadraticBezierTo(size.width * 0.4994500, size.height * 0.7636600,
        size.width * 0.5500000, size.height * 0.6393000);
    path_0.cubicTo(
        size.width * 0.5375000,
        size.height * 0.5794750,
        size.width * 0.5375000,
        size.height * 0.5794750,
        size.width * 0.5000000,
        size.height * 0.4000000);
    path_0.close();

    canvas.drawPath(path_0, paintFill0);

    // Layer 1

    Paint paintStroke0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_0, paintStroke0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
