import 'package:flutter/material.dart';

class Information extends StatefulWidget {
  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {

// Field
String loginString = '...';

// Method

Widget showLogin(){
  return Text('Name : $loginString ');

}




  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[showLogin(),],
    );
  }
}
