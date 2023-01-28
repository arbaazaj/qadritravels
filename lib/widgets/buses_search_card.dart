import 'package:flutter/material.dart';

class BusesSearchCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(boxShadow: <BoxShadow>[
        BoxShadow(
            offset: Offset(0, -5),
            blurRadius: 4,
            color: Colors.black12,
            spreadRadius: 8)
      ]),
      child: Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topRight: Radius.circular(32.0)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'AC Buses',
                    style: TextStyle(
                      color: Color(0xFF455F82),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  IconButton(icon: Icon(Icons.more_horiz), onPressed: () {})
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BusCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Column(
          children: <Widget>[

          ],
        ),
      ),
    );
  }
}
