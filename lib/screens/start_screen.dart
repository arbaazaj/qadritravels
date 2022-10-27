import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qadritravels/testing.dart';
import 'package:qadritravels/themes/colors.dart';
import 'package:qadritravels/widgets/fancy_background.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(child: AnimatedBackground()),
        onBottom(AnimatedWave(
          color: Colors.white.withOpacity(0.3),
          height: 180,
          speed: 1.0,
        )),
        onBottom(AnimatedWave(
          color: radicalRed.withOpacity(0.2),
          height: 120,
          speed: 0.9,
          offset: pi,
        )),
        onBottom(AnimatedWave(
          color: cadetBlue.withOpacity(0.3),
          height: 220,
          speed: 1.2,
          offset: pi / 2,
        )),
        onBottom(AnimatedWave(
          color: kobi.withOpacity(0.3),
          height: 280,
          speed: 0.8,
          offset: pi / 2,
        )),
        SignInUi(),
      ],
    );
  }

  onBottom(Widget child) => Positioned.fill(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: child,
        ),
      );
}

class SignInUi extends StatefulWidget {
  @override
  _SignInUiState createState() => _SignInUiState();
}

class _SignInUiState extends State<SignInUi> {
  // // Google Sign In and Firebase initialization.
  // final GoogleSignIn _googleSignIn = GoogleSignIn();
  // final FirebaseAuth _auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordKey = GlobalKey<State>();
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();
  bool _isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Material(
                color: Colors.transparent,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _emailController,
                      focusNode: _emailFocus,
                      style: TextStyle(color: backgroundColor),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: backgroundColor,
                      onFieldSubmitted: (value) {
                        _fieldFocusChange(context, _emailFocus, _passwordFocus);
                      },
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.mail_outline,
                            color: backgroundColor,
                          ),
                          hintText: 'E-mail',
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: backgroundColor),
                          )),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    TextFormField(
                      key: _passwordKey,
                      controller: _passwordController,
                      focusNode: _passwordFocus,
                      cursorColor: backgroundColor,
                      style: TextStyle(color: backgroundColor),
                      obscureText: _isObscureText,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          suffix: IconButton(
                              icon: _isObscureText == false
                                  ? Icon(
                                      FontAwesomeIcons.solidEyeSlash,
                                    )
                                  : Icon(
                                      FontAwesomeIcons.solidEye,
                                    ),
                              onPressed: () {
                                if (_isObscureText == true) {
                                  setState(() {
                                    _isObscureText = false;
                                  });
                                } else {
                                  setState(() {
                                    _isObscureText = true;
                                  });
                                }
                              }),
                          icon: Icon(
                            Icons.vpn_key,
                            color: backgroundColor,
                          ),
                          hintText: 'Password',
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: backgroundColor),
                          )),
                    ),
                    SizedBox(
                      height: 32.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        OutlinedButton(
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Testing())),
                            child: Text('Login',
                                style: TextStyle(
                                    color: backgroundColor, fontSize: 18))),
                        SizedBox(
                          width: 16.0,
                        ),
                        Text('|'),
                        SizedBox(
                          width: 16.0,
                        ),
                        OutlinedButton(
                            onPressed: () {},
                            child: Text('Register',
                                style: TextStyle(
                                    color: backgroundColor, fontSize: 18))),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Or',
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(color: smoky),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    // SignInButton(
                    //   Buttons.Google,
                    //   padding: EdgeInsets.all(4.0),
                    //   text: 'Sign In with Google',
                    //   onPressed: () {
                    //     _handleGoogleSignIn().then((onValue) {
                    //       // if (ConnectionState.waiting == true) {
                    //       //
                    //       // }
                    //       Center(child: CircularProgressIndicator());
                    //       Navigator.push(
                    //           context,
                    //           MaterialPageRoute(
                    //               builder: (context) => Testing()));
                    //     });
                    //   },
                    // ),
                  ],
                ),
              ),
            )),
      ],
    );
  }
  //
  // Future<User> _handleGoogleSignIn() async {
  //   final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
  //   final GoogleSignInAuthentication googleAuth =
  //       await googleUser.authentication;
  //
  //   final AuthCredential credential = GoogleAuthProvider.credential(
  //     idToken: googleAuth.idToken,
  //     accessToken: googleAuth.accessToken,
  //   );
  //
  //   final User user = (await _auth.signInWithCredential(credential)).user;
  //   return user;
  // }
  //
  // Future<User> _handleEmailAndPasswordSignIn(
  //     String email, String password) async {
  //   if (email.isNotEmpty && password.isNotEmpty) {
  //     final User user = (await _auth.signInWithEmailAndPassword(
  //             email: email, password: password))
  //         .user;
  //     return user;
  //   } else {
  //     return Future.error('Invalid Fields');
  //   }
  // }
  //
  // Future<User> _handleCreateUserWithEmailAndPassword(
  //     String email, String password) async {
  //   if (email.isNotEmpty && password.isNotEmpty) {
  //     final User createUser = (await _auth.createUserWithEmailAndPassword(
  //             email: email, password: password))
  //         .user;
  //     return createUser;
  //   } else {
  //     return Future.error('Invalid Fields');
  //   }
  // }

  _fieldFocusChange(
      BuildContext context, FocusNode emailFocus, FocusNode passwordFocus) {
    emailFocus.unfocus();
    FocusScope.of(context).requestFocus(passwordFocus);
  }
}
