import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Variable and Constant
  final formKey = GlobalKey<FormState>();
  String nameString, emailString, passwordString;

  // Method
  Widget passwordTextFromFied() {
    return TextFormField(
      decoration: InputDecoration(
        errorStyle: TextStyle(fontWeight: FontWeight.bold),
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
        ),
      ),
      validator: (String value) {
        if (value.length <= 5) {
          return 'Password Must More 5 Charactor';
        }
      },
      onSaved: (String value) {
        passwordString = value;
      },
    );
  }

  Widget emailTetFromField() {
    return TextFormField(
      decoration: InputDecoration(
        errorStyle: TextStyle(fontWeight: FontWeight.bold),
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
      validator: (String value) {
        if (!((value.contains('@')) && (value.contains('.')))) {
          return 'Email Format Only => you@email.com';
        }
      },
      onSaved: (String value) {
        emailString = value;
      },
    );
  }

  Widget nameTextFromField() {
    return TextFormField(
      decoration: InputDecoration(
        errorStyle: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
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
      validator: (String value) {
        value = value.trim();
        if (value.length == 0) {
          return 'Please Fill Name in Blank';
        }
      },
      onSaved: (String vaule) {
        nameString = vaule;
      },
    );
  }

  Widget uploadButtom() {
    return IconButton(
        icon: Icon(
          Icons.cloud_upload,
          size: 36.0,
        ),
        onPressed: () {
          print('You Click upload');
          if (formKey.currentState.validate()) {
            formKey.currentState.save();
            uploadToFirebase();
          }
        });
  }

  Future uploadToFirebase() async {
    print('Name = $nameString, Email = $emailString, $passwordString');

    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth
        .createUserWithEmailAndPassword(
            email: emailString, password: passwordString)
        .then((objValue) {
      print('Register Success>');
    }).catchError((objError) {
      String error = objError.message;
      print('error ==> $error');
      myShowDialog(error);
    });
  }

  Widget alertButton(BuildContext context) {
    return FlatButton(
      child: Text('Close'),onPressed: (){
        Navigator.of(context).pop();
      },
    );
  }

  void myShowDialog(String messageString) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Have Error'),
          content: Text(messageString),
          actions: <Widget>[alertButton(context)],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.orange[900],
        title: Text('Register'),
        actions: <Widget>[uploadButtom()],
      ),
      body: Form(
        key: formKey,
        child: Container(
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
      ),
    );
  }
}
