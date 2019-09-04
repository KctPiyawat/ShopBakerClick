import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shop_bakerclick/models/promotion_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:koukicons/assistant.dart';

class Marketplate extends StatefulWidget {
  @override
  _MarketplateState createState() => _MarketplateState();
}

class _MarketplateState extends State<Marketplate> {
  // Explicit
  double myH1 = 24.0;
  double myH2 = 18.0;
  Color myColorText = Colors.blue[900];
  double mySpace = 16.0;
  double iconSize = 100.0;
  List<PromotionModel> promotionModels = [];
  List<Widget> promotionsImages = [];

  // Method
  @override
  void initState() {
    super.initState();
    readProtion();
  }

  Future<void> readProtion() async {
    Firestore firestore = Firestore.instance;
    CollectionReference collectionReference = firestore.collection('Promotion');
    StreamSubscription<QuerySnapshot> subscription =
        await collectionReference.snapshots().listen((QuerySnapshot) {
      List<DocumentSnapshot> documentSnapshots = QuerySnapshot.documents;

      for (var snapshot in documentSnapshots) {
        String namePromotion = snapshot.data['NamePromotion'];
        String urlImage = snapshot.data['PathImage'];
        print('name = $namePromotion');

        PromotionModel promotionModel = PromotionModel(namePromotion, urlImage);
        setState(() {
          promotionModels.add(promotionModel);
          promotionsImages.add(makeBanner(namePromotion, urlImage));
        });
      }
    });
  }

  Widget makeBanner(String title, String urlImage) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200.0,
      child: Stack(
        children: <Widget>[
          Image.network(
            urlImage,
            fit: BoxFit.fill,
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget titleBanner(String title) {
    return Container(
      padding: EdgeInsets.only(
        left: mySpace,
        top: mySpace,
        bottom: mySpace,
      ),
      alignment: Alignment.topLeft,
      child: Text(
        title,
        style: TextStyle(
          fontSize: myH1,
          color: myColorText,
        ),
      ),
    );
  }

  Widget imageBanner() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 200.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: promotionModels.length,
        itemBuilder: (BuildContext context, int index) {
          return Image.network(promotionModels[index].pathImage);
        },
      ),
    );
  }

  Widget showBanner() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        titleBanner('What News ?'),
        bannerCarouse(),
      ],
    );
  }

  Widget bannerCarouse() {
    return CarouselSlider(
        enlargeCenterPage: true,
        aspectRatio: 16 / 9,
        pauseAutoPlayOnTouch: Duration(seconds: 5),
        autoPlay: true,
        autoPlayAnimationDuration: Duration(seconds: 5),
        items: promotionsImages);
  }

  Widget showIconGroup(Widget iconWidget, Color bgColor) {
    return Container(
      padding: EdgeInsets.all(10.0),
      color: bgColor,
      width: iconSize,
      height: iconSize,
      child: iconWidget,
    );
  }

  Widget showTextGroup(String title, String subTitle) {
    return Container(
      padding: EdgeInsets.only(
        left: 10.0,
        right: 10.0,
      ),
      color: Colors.white,
      height: iconSize,
      width: MediaQuery.of(context).size.width - iconSize,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontSize: myH1),
          ),
          Container(child: Text(subTitle)),
        ],
      ),
    );
  }

  Widget thaiCandy() {
    return Row(
      children: <Widget>[
        showIconGroup(KoukiconsAssistant(), Colors.yellow.shade300),
        showTextGroup('ขนมไทย',
            'ขนมไทยแสนอร่อย ต้นตำหรับแท้ ๆ ขนมไทยแสนอร่อย ต้นตำหรับแท้ ๆ '),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.grey.shade400,
      child: ListView(
        children: <Widget>[
          showBanner(),
          titleBanner('Category'),
          thaiCandy(),
        ],
      ),
    );
  }
}
