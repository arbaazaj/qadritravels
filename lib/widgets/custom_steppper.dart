import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qadritravels/themes/colors.dart';
import 'package:qadritravels/widgets/custom_dotted_line.dart';

class CustomStepper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Icon(
          FontAwesomeIcons.circleDot,
          color: radicalRed,
        ),
        CustomPaint(
          painter: LineDashedPainter(
            color: bermudaGray,
            maxValue: 35,
            dashSpace: 4,
            dashWidth: 2,
            strokeWidth: 2,
          ),
        ),
        Icon(
          FontAwesomeIcons.circleDot,
          color: Colors.deepPurple,
        ),
      ],
    );
  }
}
