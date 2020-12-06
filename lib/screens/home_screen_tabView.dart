import 'package:flutter/material.dart';
import 'screen_export.dart';

class TabView extends StatelessWidget {
  final TabController tabController;

  const TabView({Key key, this.tabController}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: <Widget>[
        InspireScreen(),
        MapviewScreen(),
        KeekzScreen(),
        NotificationScreen(),
        ProfileScreen()
      ],
      controller: tabController,
    );
  }
}
