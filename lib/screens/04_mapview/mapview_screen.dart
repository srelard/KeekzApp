import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:keekz_application/screens/04_mapview/local_widgets/gridCard.dart';
import 'package:keekz_application/utilities/constants.dart';

class MapviewScreen extends StatefulWidget {
  static final String id = 'map_screen';
  @override
  _MapviewScreenState createState() => _MapviewScreenState();
}

class _MapviewScreenState extends State<MapviewScreen> {
  List<Widget> _getCardsLeft() {
    final children = <Widget>[];
    for (var i = 0; i < 8; i++) {
      children.add(
        new GridCard(horizontal: i.isEven ? true : false, tag: "Held$i"),
      );
    }
    return children;
  }

  List<Widget> _getCardsRight() {
    final children = <Widget>[];
    for (var i = 9; i < 17; i++) {
      children.add(
        new GridCard(horizontal: i.isEven ? true : false, tag: "Held$i"),
      );
    }
    return children;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              color: kBlue, onPressed: () {}, icon: Icon(Icons.chevron_left)),
          title: Text(
            'MapView',
            style: TextStyle(
              color: kBlack,
              fontSize: 35.0,
            ),
          ),
        ),
        body: new StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) => new GridCard(
              horizontal: index.isEven ? true : false, tag: "Held$index"),
          staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
          mainAxisSpacing: 2.0,
          crossAxisSpacing: 2.0,
        )
        /* Container(
        //height: 1000,
        child: SingleChildScrollView(
          child: Row(
              //mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(children: _getCardsLeft()),
                Column(children: _getCardsRight()),
              ]),
        ),
      ), */
        );
  }
}
