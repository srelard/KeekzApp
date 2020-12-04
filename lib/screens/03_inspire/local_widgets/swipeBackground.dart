import 'package:flutter/material.dart';

class SwipeBackground extends StatelessWidget {
  final String text;
  final Icon icon;
  final MainAxisAlignment mainAxisAlignment;
  final TextAlign textAlign;
  final bool iconLeft;

  const SwipeBackground(
      {Key key,
      @required this.text,
      @required this.icon,
      this.mainAxisAlignment,
      this.textAlign,
      this.iconLeft})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return iconLeft
        ? (Container(
            color: Colors.white10,
            child: Align(
              child: Row(
                mainAxisAlignment: mainAxisAlignment,
                children: <Widget>[
                  icon,
                  SizedBox(
                    width: 5,
                  ),
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
          ))
        : Container(
            color: Colors.white10,
            child: Align(
              child: Row(
                mainAxisAlignment: mainAxisAlignment,
                children: <Widget>[
                  Text(
                    text,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: textAlign,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  icon,
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
