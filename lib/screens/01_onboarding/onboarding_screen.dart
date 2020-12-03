import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'local_widgets/indicator.dart';

class OnboardingScreen extends StatefulWidget {
  static final String id = 'onboarding_screen';
  final double screenHeight;
  const OnboardingScreen({
    @required this.screenHeight,
  }) : assert(screenHeight != null);
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with TickerProviderStateMixin {
  AnimationController _rippleAnimationController;
  Animation<double> _rippleAnimation;

  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

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
  void initState() {
    super.initState();
    _rippleAnimationController = AnimationController(
      vsync: this,
      duration: kRippleAnimationDuration,
    );
    _rippleAnimation = Tween<double>(
      begin: 0.0,
      end: widget.screenHeight,
    ).animate(CurvedAnimation(
      parent: _rippleAnimationController,
      curve: Curves.easeIn,
    ));
  }

  @override
  void dispose() {
    _rippleAnimationController.dispose();
    super.dispose();
  }

//... _nextPage()

  Future<void> _goToLogin() async {
    await _rippleAnimationController.forward();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => LoginScreen(
          screenHeight: widget.screenHeight,
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Stack(
          children: [
            SafeArea(
              child: Container(
                color: kWhite,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        color: kWhite,
                        alignment: Alignment.centerRight,
                        child: FlatButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen(
                                      screenHeight: MediaQuery.of(context)
                                          .size
                                          .height))), //_goToLogin(),
                          child: Text(
                            'Skip',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 60.0),
                      Container(
                        height: 600.0,
                        child: PageView(
                          physics: ClampingScrollPhysics(),
                          controller: _pageController,
                          onPageChanged: (int page) {
                            setState(() {
                              _currentPage = page;
                            });
                          },
                          children: <Widget>[
                            OnboardingCard(
                                headline: "Entdecken!",
                                subline:
                                    "Entdecke mit Keez neue Orte und Aktivitäten in deiner lokalen Nähe!",
                                image: kOnboarding1Path,
                                imageHeight: 300),
                            OnboardingCard(
                                headline: "Teilen",
                                subline:
                                    "Teile interessante Orte und Aktivitäten mit der Community und erhalte virtuelles Karma!",
                                image: kOnboarding2Path,
                                imageHeight: 300),
                            OnboardingCard(
                              headline: "Sammeln",
                              subline:
                                  "Tausche dein gesammeltes Karma gegen einen echten Baum aus!",
                              image: kOnboarding3Path,
                              imageHeight: 300,
                              repeat: false,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _buildPageIndicator(),
                      ),
                      _currentPage != _numPages - 1
                          ? Expanded(
                              child: Align(
                                alignment: FractionalOffset.bottomRight,
                                child: FlatButton(
                                  onPressed: () {
                                    _pageController.nextPage(
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.ease,
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Text(
                                        'Next',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22.0,
                                        ),
                                      ),
                                      SizedBox(width: 10.0),
                                      Icon(
                                        Icons.arrow_forward,
                                        color: Colors.black,
                                        size: 30.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : Text(''),
                    ],
                  ),
                ),
              ),
            ),
            AnimatedBuilder(
              animation: _rippleAnimation,
              builder: (_, Widget child) {
                return Ripple(
                  radius: _rippleAnimation.value,
                );
              },
            ),
          ],
        ),
      ),
      bottomSheet: _currentPage == _numPages - 1
          ? Container(
              height: 100.0,
              width: double.infinity,
              color: kGrey,
              child: GestureDetector(
                onTap: () async => await _goToLogin(),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 30.0),
                    child: Text(
                      'Starten',
                      style: TextStyle(
                        color: Color(0xFF5B16D0),
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            )
          : Text(''),
    );
  }
}
