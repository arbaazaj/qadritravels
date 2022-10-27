import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:qadritravels/themes/colors.dart';
import 'package:qadritravels/utils/offline_management.dart';
import 'package:qadritravels/widgets/custom_appbar.dart';
import 'package:qadritravels/widgets/custom_bottom_search.dart';
import 'package:qadritravels/widgets/custom_recent_trip_card.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static ConnectivityResult result;
  final bool connectionState = result != ConnectivityResult.none;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        height: 150,
      ),
      floatingActionButton: Align(
        alignment: Alignment(0.90, 0.50),
        child: FloatingActionButton(
          backgroundColor: bermudaGray,
          child: Icon(Icons.search),
          onPressed: () {},
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: connectionState
          ? MainBody()
          : OfflineManagement(
              child: Container(
                child: Text('No Internet!'),
              ),
            ),
    );
  }
}

class MainBody extends StatelessWidget {
  const MainBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Recent Trips'),
              ),
              CustomRecentTripCard(),
            ],
          ),
          Flexible(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CustomBottomSearch(),
            ),
          ),
        ],
      ),
    );
  }
}
