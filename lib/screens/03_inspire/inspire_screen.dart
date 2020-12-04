import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keekz_application/screens/03_inspire/local_widgets/swipeBackground.dart';
import 'local_widgets/keekzCard.dart';

class InspireScreen extends StatefulWidget {
  @override
  _InspireScreenState createState() => _InspireScreenState();
}

class _InspireScreenState extends State<InspireScreen> {
  final List<dynamic> cardsTutorial = [
    KeekzCard(imagePath: "lib/assets/images/placeholder/red.jpg"),
    KeekzCard(imagePath: "lib/assets/images/placeholder/green.jpg")
  ];
  final List<dynamic> cardsFinal = [
    KeekzCard(imagePath: "lib/assets/images/placeholder/blue.jpg"),
    KeekzCard(imagePath: "lib/assets/images/placeholder/yellow.jpg")
  ];
  final List<dynamic> cards = [];

  // final cards = List<dynamic>.generate(11, (i) => KeekzCard(imagePath: "lib/assets/placeholder/${i + 1}.jpg"));

  @override
  void initState() {
    super.initState();
    cards.addAll(cardsTutorial);
  }

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
            background: SwipeBackground(
              icon: Icon(Icons.delete),
              text: "Mag ich nicht",
              mainAxisAlignment: MainAxisAlignment.start,
              textAlign: TextAlign.left,
              iconLeft: true,
            ),
            secondaryBackground: SwipeBackground(
              icon: Icon(Icons.favorite),
              text: "Mag ich",
              mainAxisAlignment: MainAxisAlignment.end,
              textAlign: TextAlign.right,
              iconLeft: false,
            ),
            child: item,
            onDismissed: (direction) {
              // Remove the item from the data source.
              setState(() {
                cards.removeAt(index);
                cards.length < 1 ? cards.addAll(cardsFinal) : () => {};
              });
              String action;
              if (direction == DismissDirection.startToEnd) {
                action = "dislike";
                print(action);
              } else {
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
}
