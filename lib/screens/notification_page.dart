import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  final String? result;

  const NotificationPage({Key? key, this.result}) : super(key: key);

  @override
  NotificationPageState createState() => NotificationPageState();
}

class NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(widget.result!),
      ),
    );
  }
}
