import 'package:flutter/material.dart';

class LineDashedPainter extends CustomPainter {

  Color? color;
  double? strokeWidth;
  int? dashSpace;
  int? dashWidth;
  int? maxValue;

  LineDashedPainter({this.color, this.strokeWidth, this.dashSpace, this.dashWidth, this.maxValue});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color!
      ..strokeWidth = (strokeWidth == null ? 2 : strokeWidth)!;
    maxValue = maxValue;
    dashWidth = 5;
    dashSpace = 5;
    double startY = 0;
    while (maxValue! >= 0) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashWidth!), paint);
      final space = (dashSpace! + dashWidth!);
      startY += space;
      maxValue = (maxValue! - space);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
