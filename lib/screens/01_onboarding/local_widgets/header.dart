import 'package:flutter/material.dart';
import 'package:keekz_application/utilities/constants.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext? context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPaddingL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(Icons.ac_unit),
          const SizedBox(height: kSpaceM),
          Text(
            'Onboarding auf Keekz',
            /* style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(color: kWhite, fontWeight: FontWeight.bold), */
          ),
          const SizedBox(height: kSpaceS),
          Text(
            'Hier steht ein cooler Text',
            /*style:
                 Theme.of(context).textTheme.subtitle1.copyWith(color: kWhite), */
          ),
        ],
      ),
    );
  }
}
