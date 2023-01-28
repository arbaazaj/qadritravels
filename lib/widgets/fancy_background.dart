import 'dart:math';

import 'package:flutter/material.dart';
import 'package:qadritravels/themes/colors.dart';
import 'package:simple_animations/simple_animations.dart';

class AnimatedWave extends StatelessWidget {
  final double? height;
  final double? speed;
  final double? offset;
  final Color? color;

  const AnimatedWave(
      {Key? key, this.height, this.speed, this.offset = 0.0, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          height: height,
          width: constraints.biggest.width,
          child: MirrorAnimationBuilder(
            curve: Curves.easeInOut,
            duration: Duration(milliseconds: (5000 / speed!).round()),
            tween: Tween(begin: 0.0, end: 2 * pi),
            builder: (context, value, _) {
              double val = double.tryParse(value.toString())!.toDouble();
              return CustomPaint(
                foregroundPainter: CurvePainter(
                    value: val + offset!,
                    color: color!),
              );
            },
          ),
        );
      },
    );
  }
}

class CurvePainter extends CustomPainter {
  final double? value;
  final Color? color;

  CurvePainter({this.value, this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color!;
    final path = Path();

    final y1 = sin(value!);
    final y2 = sin(value! + pi / 2);
    final y3 = sin(value! + pi);

    final startPointY = size.height * (0.5 + 0.4 * y1);
    final controlPointY = size.height * (0.5 + 0.4 * y2);
    final endPointY = size.height * (0.5 + 0.4 * y3);

    path.moveTo(size.width * 0, startPointY);
    path.quadraticBezierTo(
        size.width * 0.5, controlPointY, size.width, endPointY);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.moveTo(size.width * 0, startPointY);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class AnimatedBackground extends StatelessWidget {
  const AnimatedBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tween = MovieTween()
      ..tween('color1', ColorTween(begin: radicalRed, end: kobi),
          duration: const Duration(seconds: 6))
      ..tween('color2', ColorTween(begin: smoky, end: kobi),
          duration: const Duration(seconds: 6));

    return MirrorAnimationBuilder<Movie>(
      curve: Curves.easeInOut,
      tween: tween,
      duration: tween.duration,
      builder: (context, value, child) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                value.get('color1'),
                value.get('color2'),
              ],
            ),
          ),
        );
      },
    );
  }
}
