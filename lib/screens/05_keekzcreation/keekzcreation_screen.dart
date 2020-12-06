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
  late List<String> _filters;
  late bool _isSelected;

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

  List<KeekzProperties> _properties = <KeekzProperties>[
    const KeekzProperties('Spazieren'),
    const KeekzProperties('Joggen'),
    const KeekzProperties('Gassi gehen'),
    const KeekzProperties('Entspannung'),
    const KeekzProperties('Sonnenuntergang'),
  ];
  List<KeekzOccasion> _occasion = <KeekzOccasion>[
    const KeekzOccasion('Spazieren'),
    const KeekzOccasion('Joggen'),
    const KeekzOccasion('Gassi gehen'),
    const KeekzOccasion('Entspannung'),
    const KeekzOccasion('Sonnenuntergang'),
  ];

  Iterable<Widget> get keekzProps sync* {
    for (KeekzProperties keekzProps in _properties) {
      yield Padding(
        padding: const EdgeInsets.all(6.0),
        child: FilterChip(
          avatar: CircleAvatar(
            child: Text(keekzProps.name[0].toUpperCase()),
          ),
          label: Text(keekzProps.name),
          selected: _filters.contains(keekzProps.name),
          onSelected: (bool selected) {
            setState(() {
              if (selected) {
                _filters.add(keekzProps.name);
              } else {
                _filters.removeWhere((String name) {
                  return name == keekzProps.name;
                });
              }
            });
          },
        ),
      );
    }
  }

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

  @override
  void initState() {
    super.initState();
    keekzOccasion.sort();
    keekzProperties.sort();
    _isSelected = false;
    _filters = <String>[];
  }

  Widget chip(String label, Color color, int i, String type) {
    return FilterChip(
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
        selected: true,
        onSelected: (bool selected) {
          setState(() {
            // type == "Properties"
            //? selected ? _filters.add(keekzProperties[i] : null   // keekzProperties.removeAt(i)
            // : keekzOccasion.removeAt(i);
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
              children: keekzProps.toList(), //_getChipsProperties(),
            ),
            SizedBox(height: 12),
            Wrap(
              spacing: 6.0,
              runSpacing: 6.0,
              children: _getChipsOccasion(),
            ),
            Text('Selected: ${_filters.join(', ')}'),
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

class KeekzOccasion {
  const KeekzOccasion(this.name);
  final String name;
}

class KeekzProperties {
  const KeekzProperties(this.name);
  final String name;
}
