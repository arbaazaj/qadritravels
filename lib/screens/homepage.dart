import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:qadritravels/themes/colors.dart';
import 'package:qadritravels/utils/offline_management.dart';
import 'package:qadritravels/widgets/custom_appbar.dart';
import 'package:qadritravels/widgets/custom_bottom_search.dart';
import 'package:qadritravels/widgets/custom_recent_trip_card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  static late ConnectivityResult result;
  final bool connectionState = result != ConnectivityResult.none;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        height: 150,
      ),
      floatingActionButton: Align(
        alignment: const Alignment(0.90, 0.50),
        child: FloatingActionButton(
          backgroundColor: bermudaGray,
          child: const Icon(Icons.search),
          onPressed: () {},
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: connectionState
          ? const MainBody()
          : const OfflineManagement(
              child: Text('No Internet!'),
            ),
    );
  }
}

class MainBody extends StatelessWidget {
  const MainBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Recent Trips'),
            ),
            CustomRecentTripCard(),
          ],
        ),
        const Flexible(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: CustomBottomSearch(),
          ),
        ),
      ],
    );
  }
}
