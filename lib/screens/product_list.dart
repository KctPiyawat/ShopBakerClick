import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  // Explicit

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // Method

  Widget titleSingOut() {
    return ListTile(
      leading: Icon(Icons.exit_to_app),
      title: Text('Sign Out & Exit'),
    );
  }

  Widget showLogo() {
    return Container(
      width: 80.0,
      height: 80.0,
      child: Image.asset('images/logo.png'),
    );
  }

  Widget showAppName() {
    return Text(
      'Baker Supply',
      style: TextStyle(
          color: Colors.red[700], fontSize: 24.0, fontFamily: 'Playball'),
    );
  }

  Widget headMyDrawer() {
    return DrawerHeader(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [Colors.white, Colors.yellow[700]],
          radius: 1.0,
        ),
      ),
      child: Container(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              showLogo(),
              showAppName(),
            ],
          )),
    );
  }

  Widget myDrawerMenu() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          headMyDrawer(),
          titleSingOut(),
        ],
      ),
    );
  }

  Widget signOutButton() {
    return Container(
      margin: EdgeInsets.only(right: 80.0),
      child: IconButton(
        tooltip: 'Sing Out',
        icon: Icon(Icons.exit_to_app),
        onPressed: () {
          print('You Click SignOut');
          mySignOut();
        },
      ),
    );
  }

  Future<void> mySignOut() async {
    await firebaseAuth.signOut().then((response) {
      exit(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        actions: <Widget>[signOutButton()],
      ),
      body: Text('body'),
      drawer: myDrawerMenu(),
    );
  }
}
