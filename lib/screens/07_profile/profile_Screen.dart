import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keekz/screens/initial/onboarding/onboarding_screen.dart';
import '../../../constants.dart';

class ProfileScreen extends StatefulWidget {
  static final String id = 'map_screen';
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          color: kDarkBlue,
          //height: MediaQuery.of(context).size.height,
          child: Text("Profile",
              style: TextStyle(
                color: kWhite,
              )),
        ),
      ),
    );
  }
}
