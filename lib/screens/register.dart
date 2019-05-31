import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Widget passwordTextFromFied() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Password : ',
          helperText: 'More 6 Charactor',
          labelStyle: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            color: Colors.blue[900],
          ),
          helperStyle: TextStyle(
            color: Colors.blue[400],
            fontStyle: FontStyle.italic,
          ),
          icon: Icon(
            Icons.lock,
            color: Colors.blue[900],
            size: 36.0,
          )),
    );
  }

  Widget emailTetFromField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Email : ',
        helperText: 'you@email.com',
        labelStyle: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
          color: Colors.green[900],
        ),
        helperStyle: TextStyle(
          color: Colors.green[400],
          fontStyle: FontStyle.italic,
        ),
        icon: Icon(
          Icons.email,
          color: Colors.green[900],
          size: 36.0,
        ),
      ),
    );
  }

  Widget nameTextFromField() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Name : ',
        helperText: 'First Nane Only',
        labelStyle: TextStyle(
            color: Colors.red[900],
            fontSize: 25.0,
            fontWeight: FontWeight.bold),
        helperStyle: TextStyle(
          color: Colors.red[400],
          fontStyle: FontStyle.italic,
        ),
        icon: Icon(
          Icons.face,
          color: Colors.red[900],
          size: 48.0,
        ),
      ),
    );
  }

  Widget uploadButtom() {
    return IconButton(
      icon: Icon(
        Icons.cloud_upload,
        size: 36.0,
      ),
      onPressed: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[900],
        title: Text('Register'),
        actions: <Widget>[uploadButtom()],
      ),
      body: Container(
        alignment: Alignment(0, -1),
        padding: EdgeInsets.only(top: 60.0, left: 50.0, right: 50.0),
        child: Column(
          children: <Widget>[
            nameTextFromField(),
            emailTetFromField(),
            passwordTextFromFied()
          ],
        ),
      ),
    );
  }
}
