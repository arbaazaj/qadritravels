import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:qadritravels/screens/notification_page.dart';
import 'package:qadritravels/themes/colors.dart';
import 'package:qadritravels/widgets/custom_appbar.dart';
import 'package:qadritravels/widgets/custom_bottom_search.dart';
import 'package:qadritravels/widgets/custom_date_selector.dart';
import 'package:qadritravels/widgets/custom_recent_trip_card.dart';

class Testing extends StatefulWidget {
  const Testing({Key? key}) : super(key: key);

  @override
  TestingState createState() => TestingState();
}

class TestingState extends State<Testing> {
//  final GoogleSignIn _googleSignIn = GoogleSignIn();
//  final FirebaseAuth _auth = FirebaseAuth.instance;
//
//  Future<FirebaseUser> _handleSignIn() async {
//    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
//    final GoogleSignInAuthentication googleAuth =
//        await googleUser.authentication;
//
//    final AuthCredential credential = GoogleAuthProvider.getCredential(
//      idToken: googleAuth.idToken,
//      accessToken: googleAuth.accessToken,
//    );
//
//    final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
//    print('Signed in ' + user.displayName);
//    return user;
//  }

  void initOneSignal() {
    OneSignal.shared.setAppId('c5cc2014-7a06-4b89-8e16-e521b71a5f20');
    OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
      if (kDebugMode) {
        print("Accepted permission: $accepted");
      }
    });
  }

  void openNotification() {
    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      var res = result.toString();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => NotificationPage(
                    result: res,
                  )));
    });
  }

  @override
  void initState() {
    super.initState();
    initOneSignal();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        height: 150,
      ),
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController fromController = TextEditingController();
  TextEditingController destinationController = TextEditingController();

  bool _isSelected1 = false;
  bool _isSelected2 = false;
  bool _isSelected3 = false;
  bool _isSelected4 = false;
  bool _isSelected5 = false;
  bool _isSelected6 = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text('Recent Trips'),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const <Widget>[
                  CustomRecentTripCard(
                    dayOfTheMonth: 'June',
                    dateOfTheMonth: 23,
                    from: 'Jaunpur',
                    destination: 'Lucknow',
                  ),
                  CustomRecentTripCard(
                    dayOfTheMonth: 'June',
                    dateOfTheMonth: 23,
                    from: 'Jaunpur',
                    destination: 'Lucknow',
                  ),
                  CustomRecentTripCard(
                    dayOfTheMonth: 'June',
                    dateOfTheMonth: 23,
                    from: 'Jaunpur',
                    destination: 'Lucknow',
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CustomDateSelector(
                    onTap: () {
                      if (_isSelected1 == true) {
                        setState(() {
                          _isSelected1 = false;
                        });
                      } else {
                        setState(() {
                          _isSelected1 = true;
                        });
                      }
                    },
                    isSelected: _isSelected1,
                    currentDay: 'Tuesday',
                    currentDate: 17,
                  ),
                  CustomDateSelector(
                    onTap: () {
                      if (_isSelected2 == true) {
                        setState(() {
                          _isSelected2 = false;
                        });
                      } else {
                        setState(() {
                          _isSelected2 = true;
                        });
                      }
                    },
                    isSelected: _isSelected2,
                    currentDay: 'Wednesday',
                    currentDate: 18,
                  ),
                  CustomDateSelector(
                    onTap: () {
                      if (_isSelected3 == true) {
                        setState(() {
                          _isSelected3 = false;
                        });
                      } else {
                        setState(() {
                          _isSelected3 = true;
                        });
                      }
                    },
                    isSelected: _isSelected3,
                    currentDay: 'Thursday',
                    currentDate: 19,
                  ),
                  CustomDateSelector(
                    onTap: () {
                      if (_isSelected4 == true) {
                        setState(() {
                          _isSelected4 = false;
                        });
                      } else {
                        setState(() {
                          _isSelected4 = true;
                        });
                      }
                    },
                    isSelected: _isSelected4,
                    currentDay: 'Friday',
                    currentDate: 20,
                  ),
                  CustomDateSelector(
                    onTap: () {
                      if (_isSelected5 == true) {
                        setState(() {
                          _isSelected5 = false;
                        });
                      } else {
                        setState(() {
                          _isSelected5 = true;
                        });
                      }
                    },
                    isSelected: _isSelected5,
                    currentDay: 'Saturday',
                    currentDate: 21,
                  ),
                  CustomDateSelector(
                    onTap: () {
                      if (_isSelected6 == true) {
                        setState(() {
                          _isSelected6 = false;
                        });
                      } else {
                        setState(() {
                          _isSelected6 = true;
                        });
                      }
                    },
                    isSelected: _isSelected6,
                    currentDay: 'Sunday',
                    currentDate: 22,
                  ),
                ],
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: CustomBottomSearch(
            elevation: 32,
            color: mystic,
            fromController: fromController,
            destinationController: destinationController,
          ),
        ),
      ],
    );
  }
}
