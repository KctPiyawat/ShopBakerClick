import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop_bakerclick/screens/information.dart';
import 'package:shop_bakerclick/screens/marketplate.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  // Explicit

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String nameLogin = '';
  double mySizeIcon = 36.0;
  double myH1 = 24.0;
  double myH2 = 18.0;
  Widget myWidget = Marketplate();

  // Method

  @override
  void initState() {
    super.initState();
    findNameLogin();
  }

  Widget myDivider() {
    return Divider(
      color: Colors.yellow[700],
    );
  }

  Future<void> findNameLogin() async {
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    setState(() {
      nameLogin = firebaseUser.displayName;
    });
    print('name = $nameLogin');
  }

  Widget titleSingOut() {
    return ListTile(
      leading: Icon(
        Icons.exit_to_app,
        size: mySizeIcon,
        color: Colors.blue,
      ),
      title: Text('Sign Out & Exit',
          style: TextStyle(fontSize: myH2, color: Colors.blue)),
    );
  }

  Widget showLogo() {
    return Container(
      width: 100.0,
      height: 100.0,
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

  Widget showLogBy() {
    return Text('Login by $nameLogin');
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
              showLogBy(),
            ],
          )),
    );
  }

  Widget myDrawerMenu() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          headMyDrawer(),
          showHomeMenu(),
          myDivider(),
          showInFoMenu(),
          myDivider(),
          titleSingOut(),
          myDivider(),
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

  Widget showHomeMenu() {
    return ListTile(
      leading: Icon(
        Icons.home,
        size: mySizeIcon,
        color: Color.fromARGB(255, 183, 28, 28),
      ),
      title: Text(
        'Marketplate',
        style:
            TextStyle(fontSize: myH2, color: Color.fromARGB(255, 183, 28, 28)),
      ),
      onTap: () {
        setState(() {
          myWidget = Marketplate();
        });
        Navigator.of(context).pop();
      },
    );
  }

  Widget showInFoMenu() {
    return ListTile(
      leading: Icon(
        Icons.info,
        size: mySizeIcon,
        color: Colors.orange,
      ),
      title: Text(
        'Information',
        style: TextStyle(
          fontSize: myH2,
          color: Colors.green,
        ),
      ),onTap: (){
        setState(() {
         myWidget = Information(); 
        });
        Navigator.of(context).pop();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        actions: <Widget>[signOutButton()],
      ),
      body: myWidget,
      drawer: myDrawerMenu(),
    );
  }
}
