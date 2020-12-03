import 'package:flutter/material.dart';
import 'package:keekz_application/screens/screen_export.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget _getScreenId() {
    // hier Überprüfung mit Firebase Auth ob er auf Loginseite oder Homeseite landet
    return Container(); //HomeScreen();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Keekz',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Builder(
          builder: (BuildContext context) {
            return SplashScreen();
          },
        ),
        routes: {
          LoginScreen.id: (context) => LoginScreen(),
          OnboardingScreen.id: (context) =>
              OnboardingScreen(screenHeight: MediaQuery.of(context).size.height)
        });
  }
}
