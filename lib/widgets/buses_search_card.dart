import 'package:flutter/material.dart';

class BusesSearchCard extends StatelessWidget {
  const BusesSearchCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: const BoxDecoration(boxShadow: <BoxShadow>[
        BoxShadow(
            offset: Offset(0, -5),
            blurRadius: 4,
            color: Colors.black12,
            spreadRadius: 8)
      ]),
      child: Card(
        margin: EdgeInsets.zero,
        shape: const RoundedRectangleBorder(
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
                  const Text(
                    'AC Buses',
                    style: TextStyle(
                      color: Color(0xFF455F82),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  IconButton(icon: const Icon(Icons.more_horiz), onPressed: () {})
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
  const BusCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Column(
        children: <Widget>[

        ],
      ),
    );
  }
}
