import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keekz_application/utilities/constants.dart';

class LoginScreen extends StatefulWidget {
  static final String id = 'map_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            color: kBlue, onPressed: () {}, icon: Icon(Icons.chevron_left)),
        title: Text(
          'LoginPage',
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
          child: Text("LoginScreen",
              style: TextStyle(
                color: kWhite,
              )),
        ),
      ),
    );
  }
}
