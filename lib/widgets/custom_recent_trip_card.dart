import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qadritravels/themes/colors.dart';
import 'package:qadritravels/widgets/custom_dotted_line.dart';

class CustomRecentTripCard extends StatelessWidget {
  final String? dayOfTheMonth;
  final int? dateOfTheMonth;
  final String? from;
  final String? destination;

  const CustomRecentTripCard(
      {Key? key,
      this.dayOfTheMonth,
      this.dateOfTheMonth,
      this.from,
      this.destination})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 2,
        height: 220.0,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          elevation: 6.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(dayOfTheMonth!,
                        style: const TextStyle(fontSize: 18.0),
                      ),
                      IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '$dateOfTheMonth',
                        style:
                            const TextStyle(fontSize: 52.0, color: Colors.lightBlue),
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        children: <Widget>[
                          const Icon(
                            FontAwesomeIcons.circleDot,
                            color: radicalRed,
                            size: 18,
                          ),
                          const SizedBox(width: 4.0),
                          Text(from!),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, top: 8.0, bottom: 20.0),
                        child: CustomPaint(
                          painter: LineDashedPainter(
                            color: bermudaGray,
                            strokeWidth: 2.0,
                            maxValue: 15,
                          ),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          const Icon(
                            FontAwesomeIcons.circleDot,
                            size: 18.0,
                            color: Colors.deepPurple,
                          ),
                          const SizedBox(width: 4.0),
                          Text(destination!),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
