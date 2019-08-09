import 'package:flutter/material.dart';

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

  // Method

  Widget titleBanner() {
    return Container(
      padding: EdgeInsets.only(
        left: mySpace,
        top: mySpace,
        bottom: mySpace,
      ),
      alignment: Alignment.topLeft,
      child: Text(
        'What News ?',
        style: TextStyle(
          fontSize: myH1,
          color: myColorText,
        ),
      ),
    );
  }

  Widget imageBanner() {
    return Container(
      color: Colors.grey,
      width: MediaQuery.of(context).size.width * 0.8,
      height: 200.0,
    );
  }

  Widget showBanner() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        titleBanner(),
        imageBanner(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[showBanner()],
    );
  }
}
