import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {

// Explicit


// Method
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    readFireStore();
  }

  Future<void> readFireStore() async{

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),body: Text('body'),
    );
  }
}
