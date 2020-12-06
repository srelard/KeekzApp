import 'package:flutter/material.dart';
import 'package:keekz_application/utilities/constants.dart';

class Indicator extends StatelessWidget {
  final bool isActive;
  const Indicator({Key? key, required this.isActive}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 30.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? kBlack : kLightBlue,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
