import 'package:flutter/material.dart';
import 'package:keekz/screens/initial/onboarding/parts/indicator.dart';

class KeekzCard extends StatefulWidget {
  final String imagePath;

  const KeekzCard({Key key, @required this.imagePath}) : super(key: key);

  @override
  _KeekzCardState createState() => _KeekzCardState(imagePath: imagePath);
}

class _KeekzCardState extends State<KeekzCard> {
  final int _numPages = 1;
  PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  final String imagePath;
  _KeekzCardState({@required this.imagePath});

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage
          ? Indicator(isActive: true)
          : Indicator(isActive: false));
    }
    return list;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 1,
      height: MediaQuery.of(context).size.height * .887,
      //color: Colors.transparent,
      decoration: BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage(imagePath),
      )),
      child: Stack(children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 120),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: EdgeInsets.symmetric(vertical: 15),
              width: MediaQuery.of(context).size.width * .2,
              height: MediaQuery.of(context).size.height * .3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlatButton(
                    color: Colors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(
                          Icons.commute,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Route',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    onPressed: () => {},
                  ),
                  FlatButton(
                    color: Colors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(
                          Icons.bookmark_border,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Speichern',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    onPressed: () => {},
                  ),
                  FlatButton(
                    color: Colors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(
                          Icons.person_add,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Folgen',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    onPressed: () => {},
                  ),
                  FlatButton(
                    color: Colors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(
                          Icons.share_outlined,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Teilen',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    onPressed: () => {},
                  ),
                ],
              ),
            ),
          ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(""),
                /* FlatButton(
                  onPressed: () => {print("Previous")},
                  child: Text(""),
                ), */
              ),
              FlatButton(
                padding: EdgeInsets.all(20),
                onPressed: () => {print("Previous")},
                child: Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ],
          ),
          Expanded(child: SizedBox()),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(""),
                /* FlatButton(
                  onPressed: () => {print("Previous")},
                  child: Text(""),
                ), */
              ),
              FlatButton(
                padding: EdgeInsets.all(20),
                onPressed: () => {print("Previous")},
                child: Icon(
                  Icons.chevron_right,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ],
          )
        ]),
      ]),
    );
  }
}
