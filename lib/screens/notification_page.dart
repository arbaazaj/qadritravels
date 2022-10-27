import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  final String result;

  const NotificationPage({Key key, this.result}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text(widget.result),
        ),
      ),
    );
  }
}
