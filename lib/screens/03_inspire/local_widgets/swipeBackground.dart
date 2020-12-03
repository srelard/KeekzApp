import 'package:flutter/material.dart';

class SwipeBackground extends StatelessWidget {
  final String text;
  final Icon icon;
  final MainAxisAlignment mainAxisAlignment;
  final TextAlign textAlign;

  const SwipeBackground(
      {Key key,
      @required this.text,
      @required this.icon,
      this.mainAxisAlignment,
      this.textAlign})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white10,
      child: Align(
        child: Row(
          mainAxisAlignment: mainAxisAlignment,
          children: <Widget>[
            icon,
            Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
              textAlign: textAlign,
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        alignment: Alignment.centerRight,
      ),
    );
  }
}
