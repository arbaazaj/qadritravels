import 'package:flutter/material.dart';
import 'package:qadritravels/screens/start_screen.dart';

void main() => runApp(QadriTravels());

class QadriTravels extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Qadri Travels',
      theme: ThemeData(
        fontFamily: 'Lato',
        primarySwatch: Colors.blue,
      ),
      home: StartScreen(),
    );
  }
}
