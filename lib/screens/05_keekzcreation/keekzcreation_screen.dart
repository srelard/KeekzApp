import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:keekz/screens/home/keekz/indicator_keekz.dart';
import 'package:keekz/screens/initial/onboarding/onboarding_screen.dart';
import '../../../constants.dart';

class KeekzScreen extends StatefulWidget {
  static final String id = 'map_screen';
  @override
  _KeekzScreenState createState() => _KeekzScreenState();
}

class _KeekzScreenState extends State<KeekzScreen> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kLake =
      CameraPosition(target: LatLng(51.2189, 8.7575), zoom: 10.151926040649414);
  final int _numPages = 2;
  int _currentPage = 0;
  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage
          ? IndicatorKeekz(isActive: true)
          : IndicatorKeekz(isActive: false));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            color: kBlue,
            onPressed: () {
              Navigator.pushNamed(context, OnboardingScreen.id);
            },
            icon: Icon(Icons.chevron_left)),
        title: Text(
          'Keekz',
          style: TextStyle(
            color: kBlack,
            fontSize: 35.0,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: _buildPageIndicator(),
              ),
            ),
            SizedBox(height: 0),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              //color: kWhite,
              //height: MediaQuery.of(context).size.height,
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
              height: 300,
              child: GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: _kLake,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            ),
            SizedBox(height: 12),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              //color: kWhite,
              //height: MediaQuery.of(context).size.height,
              child: Text("Füge Hashtags hinzu:",
                  style: TextStyle(
                    color: kBlack,
                    fontSize: 20,
                  )),
            ),
            SizedBox(height: 12),
            Container(
              //alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              //color: kWhite,
              //height: MediaQuery.of(context).size.height,
              child: Expanded(
                child: SizedBox(
                  height: 70.0,
                  /*  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, position) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "Hashtag ${position.toString()}",
                            style: TextStyle(fontSize: 22.0),
                          ),
                        ),
                      );
                    },
                  ), */
                ),
              ),
            ),
            SizedBox(height: 12),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: RaisedButton(
                child: Text("WEITER"),
                onPressed: () => {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
