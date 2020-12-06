import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MaterialBar extends StatelessWidget {
  final TabController tabController;

  const MaterialBar({Key key, this.tabController}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
        animationDuration: Duration(milliseconds: 20),
        color: Colors.black,
        textStyle: TextStyle(fontSize: 10),
        child: TabBar(
          labelStyle: TextStyle(fontSize: 11),
          labelPadding: EdgeInsets.all(0),
          tabs: <Tab>[
            Tab(
              iconMargin: EdgeInsets.symmetric(vertical: 5),
              icon: Icon(
                MdiIcons.mapMarkerRadius,
                size: 32.0,
              ),
              text: "Inspirieren",
            ),
            Tab(
              iconMargin: EdgeInsets.symmetric(vertical: 5),
              icon: Icon(
                Icons.map_outlined,
                size: 32.0,
              ),
              text: "Karte",
            ),
            Tab(
              iconMargin: EdgeInsets.symmetric(vertical: 5),
              icon: Icon(
                Icons.add,
                size: 32.0,
              ),
              text: "Keekz",
            ),
            Tab(
              iconMargin: EdgeInsets.symmetric(vertical: 5),
              icon: Icon(
                Icons.notifications,
                size: 32.0,
              ),
              text: "Benachrichtigung",
            ),
            Tab(
              iconMargin: EdgeInsets.symmetric(vertical: 5),
              icon: Icon(
                Icons.person,
                size: 32.0,
              ),
              text: "Profil",
            ),
          ],
          controller: tabController,
        ));
  }
}
