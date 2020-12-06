import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keekz_application/screens/04_mapview/local_widgets/gridCard.dart';
import 'package:keekz_application/utilities/constants.dart';

class MapviewScreen extends StatefulWidget {
  static final String id = 'map_screen';
  @override
  _MapviewScreenState createState() => _MapviewScreenState();
}

class _MapviewScreenState extends State<MapviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            color: kBlue, onPressed: () {}, icon: Icon(Icons.chevron_left)),
        title: Text(
          'MapView',
          style: TextStyle(
            color: kBlack,
            fontSize: 35.0,
          ),
        ),
      ),
      body: Container(
        //height: 1000,
        child: SingleChildScrollView(
          child: Row(
              //mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(children: [
                  GridCard(horizontal: true),
                  GridCard(horizontal: false),
                  GridCard(horizontal: true),
                  GridCard(horizontal: false),
                ]),
                Column(children: [
                  GridCard(horizontal: false),
                  GridCard(horizontal: true),
                  GridCard(horizontal: false),
                  GridCard(horizontal: true),
                ]),
              ]),
        ),
      ),
    );
  }
}
