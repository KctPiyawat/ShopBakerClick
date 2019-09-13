import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
// Explicit

String categoryString = 'อาหารจานด่วน';

// Method
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readFireStore();
  }

  Future<void> readFireStore() async {
    Firestore firestore = Firestore.instance;
    await firestore
        .collection('Shop')
        .document('HappyTeaTimes')
        .collection('Menu_Types')
        .document(categoryString)
        .collection('Menu_Items')
        .snapshots()
        .listen((response) {
      List<DocumentSnapshot> snapshots = response.documents;
      for (var snapshot in snapshots) {
        String nameDocument = snapshot.documentID;
        print('nameDocument = $nameDocument');
        String nameTitle = snapshot.data['NameFood'];
        print('nameTitle = $nameTitle');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text('body'),
    );
  }
}
