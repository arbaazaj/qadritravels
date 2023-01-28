import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qadritravels/testing.dart';
import 'package:qadritravels/themes/colors.dart';
import 'package:qadritravels/widgets/fancy_background.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

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
        const SignInUi(),
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
  const SignInUi({Key? key}) : super(key: key);

  @override
  SignInUiState createState() => SignInUiState();
}

class SignInUiState extends State<SignInUi> {
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
                      style: const TextStyle(color: backgroundColor),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: backgroundColor,
                      onFieldSubmitted: (value) {
                        _fieldFocusChange(context, _emailFocus, _passwordFocus);
                      },
                      decoration: const InputDecoration(
                          icon: Icon(
                            Icons.mail_outline,
                            color: backgroundColor,
                          ),
                          hintText: 'E-mail',
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: backgroundColor),
                          )),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    TextFormField(
                      key: _passwordKey,
                      controller: _passwordController,
                      focusNode: _passwordFocus,
                      cursorColor: backgroundColor,
                      style: const TextStyle(color: backgroundColor),
                      obscureText: _isObscureText,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          suffix: IconButton(
                              icon: _isObscureText == false
                                  ? const Icon(
                                      FontAwesomeIcons.solidEyeSlash,
                                    )
                                  : const Icon(
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
                          icon: const Icon(
                            Icons.vpn_key,
                            color: backgroundColor,
                          ),
                          hintText: 'Password',
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: backgroundColor),
                          )),
                    ),
                    const SizedBox(
                      height: 32.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        OutlinedButton(
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Testing())),
                            child: const Text('Login',
                                style: TextStyle(
                                    color: backgroundColor, fontSize: 18))),
                        const SizedBox(
                          width: 16.0,
                        ),
                        const Text('|'),
                        const SizedBox(
                          width: 16.0,
                        ),
                        OutlinedButton(
                            onPressed: () {},
                            child: const Text('Register',
                                style: TextStyle(
                                    color: backgroundColor, fontSize: 18))),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    // Text(
                    //   'Or',
                    //   style: Theme.of(context)
                    //       .textTheme
                    //       .headline6
                    //       !.copyWith(color: smoky),
                    // ),
                    // const SizedBox(
                    //   height: 4,
                    // ),
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
