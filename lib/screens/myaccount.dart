import 'package:flutter/material.dart';
import 'package:qadritravels/themes/colors.dart';

class MyAccount extends StatefulWidget {
  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  //final GoogleSignIn _googleSignIn = GoogleSignIn();
  //final FirebaseAuth _auth = FirebaseAuth.instance;

  // Future<User> _handleSignIn() async {
  //   //final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
  //   //final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
  //
  //   // final AuthCredential credential = GoogleAuthProvider.credential(
  //   //   idToken: googleAuth.idToken,
  //   //   accessToken: googleAuth.accessToken,
  //   // );
  //
  //   final User user = (await _auth.signInWithCredential(credential)).user;
  //   print('Signed in ' + user.displayName);
  //   return user;
  // }

  List<String> settings = [
    'My bookings',
    'Recent trips',
    'Notifications',
    'Settings',
    'Sign Out'
  ];

  @override
  Widget build(BuildContext context) {
    //double screenWidth = (MediaQuery.of(context).size.width / 2) / 2;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: radicalRed,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context)),
      ),
      body: Container(
        color: radicalRed,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 32.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width / 2),
                    border: Border.all(
                        color: Colors.white,
                        style: BorderStyle.solid,
                        width: 2.0)),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 100,
                  child: Hero(
                      tag: 'profileAvatar',
                      child: Image.asset('assets/placeholder.png',
                          fit: BoxFit.fill)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ElevatedButton(
                child: Text('Sign In'),
                onPressed: () {
                  //_handleSignIn();
                },
              ),
            ),
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(1, 1),
                        blurRadius: 8,
                        spreadRadius: 8)
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  color: backgroundColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: ListView(
                    children: settings.map((item) {
                      return Column(
                        children: <Widget>[
                          ListTile(
                            title: Text(item,
                                style: TextStyle(
                                    fontSize: 20.0,
                                    color: smoky,
                                    fontWeight: FontWeight.bold)),
                            onTap: () async {
                              if (item == 'Sign Out') {
                                //final User user = _auth.currentUser;
                                // // if (user == null) {
                                // //   print('No one has signed in.');
                                // //   return;
                                // // }
                                // // _signOut();
                                // // final String uid = user.uid;
                                // print(uid + ' has successfully signed out.');
                              }
                              print(item);
                            },
                          ),
                          Divider(),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // void _signOut() async {
  //   await _auth.signOut();
  // }
}
