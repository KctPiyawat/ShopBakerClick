import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop_bakerclick/models/menu_item_model.dart';

class Category extends StatefulWidget {
  final String myCategory;
  Category({Key key, this.myCategory}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
// Explicit

  String categoryString;
  List<MenuItemModel> menuItemModels = [];

// Method
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupVariable();
    readFireStore();
  }

  void setupVariable() {
    categoryString = widget.myCategory;
    print('categoryString = $categoryString');
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
        MenuItemModel menuItemModel = MenuItemModel.fromsnapshot(snapshot.data);
        setState(() {
          menuItemModels.add(menuItemModel);
        });
      }
    });
  }

  Widget showName(int index){
    return Text(menuItemModels[index].nameFood);
  }

  Widget showText(int index) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.width * 0.4,
      child: Column(children: <Widget>[showName(index),],),
    );
  }

  Widget showPictrue(int index) {
    return Container( 
      padding: EdgeInsets.all(16.0),
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.width * 0.4,
      child: Image.network(
        menuItemModels[index].pathImage,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget showList(int index) {
    return Row(
      children: <Widget>[showPictrue(index), showText(index)],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: menuItemModels.length,
        itemBuilder: (BuildContext context, int index) {
          return showList(index);
        },
      ),
    );
  }
}
