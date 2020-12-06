import 'package:flutter/material.dart';
import 'package:keekz_application/utilities/constants.dart';

class Indicator extends StatelessWidget {
  final bool isActive;
  const Indicator({Key key, @required this.isActive}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 6.0,
      width: isActive
          ? MediaQuery.of(context).size.width * 0.46
          : MediaQuery.of(context).size.width * 0.46,
      decoration: BoxDecoration(
        color: isActive ? kBlue : Colors.grey[400],
        borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
    );
  }
}
