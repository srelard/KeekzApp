import 'package:flutter/material.dart';
import 'package:keekz_application/utilities/constants.dart';
import 'package:lottie/lottie.dart';

class OnboardingCard extends StatelessWidget {
  final String headline;
  final String subline;
  final String image;
  final bool repeat;
  final double imageHeight;
  const OnboardingCard(
      {Key key,
      @required this.headline,
      @required this.subline,
      @required this.image,
      @required this.imageHeight,
      this.repeat})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
              child: Lottie.asset(image, height: imageHeight, repeat: repeat)),
          SizedBox(height: 30.0),
          Text(
            headline,
            style: kTitleStyle,
          ),
          SizedBox(height: 15.0),
          Text(
            subline,
            style: kSubtitleStyle,
          ),
        ],
      ),
    );
  }
}
