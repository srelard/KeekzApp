import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:keekz_application/utilities/constants.dart';

import 'local_widgets/indicator.dart';

class KeekzScreen extends StatefulWidget {
  static final String id = 'map_screen';
  @override
  _KeekzScreenState createState() => _KeekzScreenState();
}

class _KeekzScreenState extends State<KeekzScreen> {
  final List<String> keekzProperties = [
    "Idyllisch",
    "Städtisch",
    "Historisch",
    "Grün"
  ];
  final List<String> keekzOccasion = [
    "Spazieren",
    "Joggen",
    "Gassi gehen",
    "Entspannung",
    "Aussicht",
    "Sonnenuntergang",
    "Date",
    "Spielplatz",
    "See",
    "Picknick",
    "Kultur",
  ];

  final int _numPages = 2;
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage
          ? Indicator(isActive: true)
          : Indicator(isActive: false));
    }
    return list;
  }

  Widget chip(String label, Color color, int i, String type) {
    return Chip(
        key: UniqueKey(),
        labelPadding: EdgeInsets.all(5.0),
        avatar: CircleAvatar(
          backgroundColor: Colors.grey.shade600,
          child: Text(label[0].toUpperCase()),
        ),
        label: Text(
          label,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: color,
        elevation: 0.0,
        shadowColor: Colors.grey[60],
        padding: EdgeInsets.all(6.0),
        onDeleted: () {
          setState(() {
            type == "properties"
                ? keekzProperties.removeAt(i)
                : keekzOccasion.removeAt(i);
          });
        });
  }

  //List<Widget> _getChips(BuildContext context) {}

  List<Widget> _getChipsOccasion() {
    List<Widget> chipsList = [];
    for (int i = 0; i < keekzOccasion.length; i++) {
      chipsList.add(
        chip(keekzOccasion[i], Color(0xFF4db6ff), i, "Occasion"),
      );
    }
    return chipsList;
  }

  List<Widget> _getChipsProperties() {
    List<Widget> chipsList = [];
    for (int i = 0; i < keekzProperties.length; i++) {
      chipsList.add(
        chip(keekzProperties[i], Color(0xFF4db6ac), i, "Properties"),
      );
    }
    return chipsList;
  }

  @override
  void initState() {
    super.initState();
    keekzOccasion.sort();
    keekzProperties.sort();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            color: kBlue, onPressed: () {}, icon: Icon(Icons.chevron_left)),
        title: Text(
          'KeekzCreation',
          style: TextStyle(
            color: kBlack,
            fontSize: 35.0,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: _buildPageIndicator(),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              child: Text("Wähle hier den Ort aus:",
                  style: TextStyle(
                    color: kBlack,
                    fontSize: 20,
                  )),
            ),
            SizedBox(height: 12),
            Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: 100,
                child: Text("Hier kommt Google Maps Karte")),
            SizedBox(height: 12),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              child: Text("Füge Hashtags hinzu:",
                  style: TextStyle(
                    color: kBlack,
                    fontSize: 20,
                  )),
            ),
            SizedBox(height: 12),
            Container(
              width: MediaQuery.of(context).size.width,
              child: SizedBox(height: 70.0, child: Text("")),
            ),
            SizedBox(height: 12),
            Wrap(
              alignment: WrapAlignment.start,
              spacing: 6.0,
              runSpacing: 6.0,
              children: _getChipsProperties(),
            ),
            SizedBox(height: 12),
            Wrap(
              spacing: 6.0,
              runSpacing: 6.0,
              children: _getChipsOccasion(),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: RaisedButton(
                child: Text("WEITER"),
                onPressed: () => {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
