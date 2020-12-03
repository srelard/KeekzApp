import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'local_widgets/keekzCard.dart';

class InspireScreen extends StatefulWidget {
  @override
  _InspireScreenState createState() => _InspireScreenState();
}

class _InspireScreenState extends State<InspireScreen> {
  final cards = List<dynamic>.generate(
      11, (i) => KeekzCard(imagePath: "lib/assets/${i + 1}.jpg"));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: cards.length,
        itemBuilder: (context, index) {
          final item = cards[index];
          return Dismissible(
            dismissThresholds: {
              DismissDirection.startToEnd: 0.1,
              DismissDirection.endToStart: 0.1
            },
            resizeDuration: Duration(milliseconds: 200),
            movementDuration: Duration(milliseconds: 200),
            key: UniqueKey(),
            background: slideRightBackground(),
            secondaryBackground: slideLeftBackground(),
            child: item,
            onDismissed: (direction) {
              // Remove the item from the data source.
              setState(() {
                cards.removeAt(index);
              });
              String action;
              if (direction == DismissDirection.startToEnd) {
                //dislike this place
                action = "dislike";
                print(action);
              } else {
                //like this place
                action = "like";
                print(action);
              }
              // Then show a snackbar.
              /*  Scaffold.of(context).showSnackBar(SnackBar(
                content: Text("$item dismissed"),
                duration: Duration(seconds: 1),
              )); */
            },
          );
        },
      ),
    );
  }

  Widget slideRightBackground() {
    return Container(
      color: Colors.white10,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.edit,
              color: Colors.black,
            ),
            Text(
              " Mir gefällt es hier!",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        alignment: Alignment.centerLeft,
      ),
    );
  }

  Widget slideLeftBackground() {
    return Container(
      color: Colors.white10,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.delete,
              color: Colors.black,
            ),
            Text(
              " Mir gefällt es hier nicht!",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.right,
            ),
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
