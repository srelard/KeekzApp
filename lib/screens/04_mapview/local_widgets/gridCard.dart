import 'package:flutter/material.dart';

class GridCard extends StatelessWidget {
  final bool horizontal;

  const GridCard({Key key, @required this.horizontal}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: Container(
        height: horizontal == true ? 200 : 350,
        width: horizontal == true ? 200 : 200,
        child: Card(
          color: Colors.amber,
        ),
      ),
    );
  }
}
