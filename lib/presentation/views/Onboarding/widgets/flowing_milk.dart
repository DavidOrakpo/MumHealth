// import 'dart:ffi';

import 'package:flutter/material.dart';

class MyPainter extends CustomPainter {
  final double h1;
  final double h2;
  final double h3;
  final double h4;

  MyPainter(this.h1, this.h2, this.h3, this.h4);

  @override
  void paint(Canvas canvas, Size size) {
    // logger.i("Size: $size");
    var paint = Paint();
    paint
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    var path = Path();
    path.moveTo(0, size.height / h1);

    path.cubicTo(size.width * .4, size.height / h2, size.width * .7,
        size.height / h3, size.width, size.height / h4);

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
