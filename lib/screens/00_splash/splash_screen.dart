import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../screen_export.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final spinkit = SpinKitRotatingCircle(
    color: Colors.black,
    size: 50.0,
  );
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomeScreen(
                    screenHeight: MediaQuery.of(context).size.height))));

    /*  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => OnboardingScreen(screenHeight: MediaQuery.of(context).size.height)))); */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text("Keekz",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 25.0,
            )),
        SizedBox(
          height: 20,
        ),
        spinkit,
      ]),
    );
  }
}
