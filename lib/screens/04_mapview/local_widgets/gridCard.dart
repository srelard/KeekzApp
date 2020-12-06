import 'package:flutter/material.dart';
import 'package:keekz_application/widgets/KeekzViewerScreen.dart';
import 'package:page_transition/page_transition.dart';

class GridCard extends StatelessWidget {
  final bool horizontal;
  final String tag;
  const GridCard({Key key, @required this.horizontal, this.tag})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => KeekzViewerScreen(tag: tag),
        ),
      ),
      child: Hero(
        tag: tag,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
          child: Container(
            height: horizontal == true ? 200 : 350,
            width: horizontal == true ? 200 : 200,
            child: Card(
              color: Colors.amber,
            ),
          ),
        ),
      ),
    );
  }
}
