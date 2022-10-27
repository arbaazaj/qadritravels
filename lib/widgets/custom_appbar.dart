import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qadritravels/screens/myaccount.dart';
import 'package:qadritravels/themes/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const CustomAppBar({Key key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var todaysDate = DateTime.now();
    var weekday = DateFormat('EEEEE', 'en_US').format(todaysDate);

    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Container(
                  child: Text(
                    '${todaysDate.day}',
                    style: TextStyle(
                      color: radicalRed,
                      fontSize: 48,
                    ),
                  ),
                ),
              ),
              Container(
                child: Text(
                  '$weekday',
                  style: TextStyle(color: smoky, fontSize: 24),
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyAccount()));
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 0, right: 30, bottom: 16),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 30.0,
                child: Hero(
                    tag: 'profileAvatar',
                    child: Image.asset('assets/placeholder.png')),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
