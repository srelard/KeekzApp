import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      body: Center(
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: kDarkBlue,
          child: Text("MapView",
              style: TextStyle(
                color: kWhite,
              )),
        ),
      ),
    );
  }
}