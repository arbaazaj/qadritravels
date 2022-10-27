import 'package:flutter/material.dart';

class LineDashedPainter extends CustomPainter {

  Color color;
  double strokeWidth;
  int dashSpace;
  int dashWidth;
  int max;

  LineDashedPainter({this.color, this.strokeWidth, this.dashSpace, this.dashWidth, this.max});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth == null ? 2 : strokeWidth;
    max = max;
    dashWidth = 5;
    dashSpace = 5;
    double startY = 0;
    while (max >= 0) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashWidth), paint);
      final space = (dashSpace + dashWidth);
      startY += space;
      max -= space;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
