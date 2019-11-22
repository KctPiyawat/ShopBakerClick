import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shop_bakerclick/screens/my_service.dart';
import 'register.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auten extends StatefulWidget {
  @override
  _AutenState createState() => _AutenState();
}

class _AutenState extends State<Auten> {
// Create Field
  String appName = 'Bakerclick Shop';
  final formKey = GlobalKey<FormState>();
  String emailString, passwordString;

// Method
  @override
  void initState() {
    super.initState();
    checkStatus();
  }

  Future<void> checkStatus() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    if (firebaseUser != null) {
      moveToProduct();
    }
  }

  void moveToProduct() {
    var productRoute =
        MaterialPageRoute(builder: (BuildContext context) => MyService());
    Navigator.of(context)
        .pushAndRemoveUntil(productRoute, (Route<dynamic> route) => false);
  }

  Widget showLogo() {
    return Image.asset('images/logo.png');
  }

  Widget showAppName() {
    return Text(
      appName,
      style: TextStyle(
          fontFamily: 'Playball',
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          color: Colors.blue[900]),
    );
  }

  Widget userTextFromField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Your User :',
        hintText: 'User not Blank',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please Fill Email in Blank';
        }
      },
      onSaved: (String value) {
        emailString = value;
      },
    );
  }

  Widget passwordFromField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Your Password',
        hintText: 'More 6 charator',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please Fill Password';
        }
      },
      onSaved: (String value) {
        passwordString = value;
      },
    );
  }

  Widget signIn() {
    return FlatButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      color: Colors.blue[900],
      child: Text(
        'Sign In',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        print('Click SignIn');
        checkSpce();
      },
    );
  }

  void checkSpce() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      print('email = $emailString, password = $passwordString');
      authenFirebase();
    }
  }

  Future<void> authenFirebase() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth
        .signInWithEmailAndPassword(
            email: emailString, password: passwordString)
        .then((var responnse) {
      print('Authen Success');
      moveToProduct();
    }).catchError((var response) {
      print('Cannot Authen');
      print('respone ==> $response');
      String title = response.code;
      String message = response.message;
      print('title = = $title, message = $message');
      myAlert(title, message);
    });
  }

  void myAlert(String tiltlesString, String messageString) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            tiltlesString,
            style: TextStyle(color: Colors.red),
          ),
          content: Text(messageString),
          actions: <Widget>[
            FlatButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }

  Widget signUp(BuildContext context) {
    return OutlineButton(
      borderSide: BorderSide(color: Colors.blue[900]),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      child: Text(
        'Sign Up',
        style: TextStyle(color: Colors.blue[900]),
      ),
      onPressed: () {
        print('You Clikc Signup');

        // Create Route
        var registerRoute =
            MaterialPageRoute(builder: (BuildContext context) => Register());
        Navigator.of(context).push(registerRoute);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.yellow[400],
      resizeToAvoidBottomPadding: true,
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              constraints: BoxConstraints.expand(width: 200.0, height: 180.0),
              child: showLogo(),
            ),
            Container(
              child: showAppName(),
            ),
            Container(
              margin: EdgeInsets.only(left: 50.0, right: 50.0),
              child: userTextFromField(),
            ),
            Container(
              margin: EdgeInsets.only(left: 50.0, right: 50.0),
              child: passwordFromField(),
            ),
            Container(
              margin: EdgeInsets.only(left: 50.0, right: 50.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: 2.5),
                      child: signIn(),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 2.5),
                      child: signUp(context),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
