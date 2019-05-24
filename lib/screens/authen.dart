import 'package:flutter/material.dart';

class Auten extends StatefulWidget {
  @override
  _AutenState createState() => _AutenState();
}

class _AutenState extends State<Auten> {
// Create Field
  String appName = 'Bakerclick Shop';

// Method
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
      decoration:
          InputDecoration(labelText: 'Your User :', hintText: 'User not Blank'),
    );
  }

  Widget passwordFromField() {
    return TextFormField(
        decoration: InputDecoration(
            labelText: 'Your Password', hintText: 'More 6 charetor'));
  }

  Widget signIn() {
    return RaisedButton(
      child: Text('Sign In'),
      onPressed: () {},
    );
  }

  Widget signUp() {
    return RaisedButton(
      child: Text('Sign Up'),
      onPressed: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        padding: EdgeInsets.only(top: 120.0),
        color: Colors.yellow,
        alignment: Alignment(0, -1),
        child: Column(
          children: <Widget>[
            Container(
              constraints: BoxConstraints.expand(width: 200.0, height: 200.0),
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
                      child: signUp(),
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
