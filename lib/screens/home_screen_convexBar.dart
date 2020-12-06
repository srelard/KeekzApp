import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ConvexBar extends StatelessWidget {
  final TabController tabController;

  const ConvexBar({Key key, this.tabController}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      backgroundColor: Colors.black,
      style: TabStyle.fixedCircle,
      height: 50,
      curveSize: 100,
      top: -18,
      cornerRadius: 0,
      items: [
        TabItem(icon: MdiIcons.mapMarkerRadius, title: "Inspirieren"),
        TabItem(icon: Icons.map_outlined, title: "Inspirieren"),
        TabItem(icon: Icons.add, title: "Inspirieren"),
        TabItem(icon: Icons.notifications, title: "Inspirieren"),
        TabItem(icon: Icons.person, title: "Inspirieren"),
      ],
      initialActiveIndex: 1 /*optional*/,
      onTap: (int i) => print('click index=$i'),
    );
  }
}
