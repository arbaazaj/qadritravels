import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qadritravels/screens/search_buses.dart';
import 'package:qadritravels/themes/colors.dart';

class CustomBottomSearch extends StatelessWidget {
  final TextEditingController? fromController;
  final TextEditingController? destinationController;
  final double? elevation;
  final Color? color;

  const CustomBottomSearch(
      {Key? key,
      this.fromController,
      this.destinationController,
      this.elevation,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String from, destination;

    return Card(
      clipBehavior: Clip.antiAlias,
      color: color,
      margin: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topRight: Radius.circular(42))),
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 10,
          right: 10,
          left: 10,
          top: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              controller: fromController,
              style: const TextStyle(fontSize: 22.0, color: radicalRed),
              decoration: const InputDecoration(
                  icon: Icon(
                    FontAwesomeIcons.circleDot,
                    color: radicalRed,
                  ),
                  labelText: 'From',
                  border: InputBorder.none,
                  labelStyle: TextStyle(color: bermudaGray)),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(left: 38.0),
                    child: Divider(
                      color: bermudaGray,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: FloatingActionButton(
                    backgroundColor: darkAccent,
                    onPressed: () {
                      from = fromController!.text;
                      destination = destinationController!.text;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchBuses(
                                    from: from,
                                    destination: destination,
                                  )));
                    },
                    child: const Icon(Icons.search),
                  ),
                ),
              ],
            ),
            TextField(
              controller: destinationController,
              style: const TextStyle(fontSize: 22.0, color: Colors.deepPurple),
              decoration: const InputDecoration(
                  icon: Icon(
                    FontAwesomeIcons.circleDot,
                    color: Colors.deepPurple,
                  ),
                  border: InputBorder.none,
                  labelText: 'Destination',
                  labelStyle: TextStyle(color: bermudaGray)),
            ),
          ],
        ),
      ),
    );
  }
}
