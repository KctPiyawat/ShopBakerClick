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
  // Methot
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
    );
  }
}
