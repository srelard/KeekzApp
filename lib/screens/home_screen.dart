import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keekz_application/utilities/constants.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'screen_export.dart';

class HomeScreen extends StatefulWidget {
  final double screenHeight;
  const HomeScreen({
    @required this.screenHeight,
  }) : assert(screenHeight != null);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTab = 0;
  PageController _pageController;
  //TabController _tabController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    // _tabController = TabController(length: 5, vsync: this);
  }

  /* @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:

          /* TabBarView(
        children: <Widget>[
          InspireScreen(),
          MapviewScreen(),
          KeekzScreen(),
          NotificationScreen(),
          ProfileScreen()
        ],
        controller: _tabController,
      ), */
          PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: <Widget>[
          InspireScreen(),
          MapviewScreen(),
          KeekzScreen(),
          NotificationScreen(),
          ProfileScreen(),
        ],
        onPageChanged: (int index) {
          setState(() {
            _currentTab = index;
          });
        },
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {},
        backgroundColor: kBlue,
        child: new Icon(Icons.add),
        elevation: 4.0,
      ),
      bottomNavigationBar:

          /* Material(
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
          controller: _tabController,
        ), */

          /* ConvexAppBar(
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
      ), */

          CupertinoTabBar(
        backgroundColor: Colors.black,
        activeColor: kBlue,
        currentIndex: _currentTab,
        onTap: (int index) {
          setState(() {
            _currentTab = index;
          });
          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 10),
            curve: Curves.easeIn,
          );
        },
        inactiveColor: kWhite,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              MdiIcons.mapMarkerRadius,
              size: 32.0,
            ),
            label: "Inspirieren",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.map_outlined,
              size: 32.0,
            ),
            label: "Karte",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
              size: 32.0,
            ),
            label: "Keekz",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
              size: 32.0,
            ),
            label: "Benachrichtigung",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 32.0,
            ),
            label: "Profil",
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
