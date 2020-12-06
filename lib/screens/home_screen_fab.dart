import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keekz_application/utilities/constants.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'screen_export.dart';

class HomeScreen extends StatefulWidget {
  final double screenHeight;
  const HomeScreen({
    required this.screenHeight,
  }) : assert(screenHeight != null);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTab = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
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
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Colors.black,
        activeColor: kBlue,
        currentIndex: _currentTab,
        onTap: (int index) {
          setState(() {
            _currentTab = index;
          });
          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 200),
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
            Icons.ac_unit,
            color: Colors.black,
          )),
          /* BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
              size: 32.0,
            ),
            label: "Keekz",
          ), */
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
