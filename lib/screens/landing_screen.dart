import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fancyapp/screens/home_screen.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.asset(
              'images/onboarding.jpg',
              fit: BoxFit.cover,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200.withOpacity(0.5),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                ),
              ),
            ),
            Positioned(
              right: 16.0,
              top: 70.0,
              child: Container(
                child: Text(
                  'FANCY',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'OpenSans',
                    letterSpacing: 2.5,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 16.0,
              top: 70.0,
              child: Container(
                child: Text(
                  'Skip',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade400,
                    fontFamily: 'OpenSans',
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width - 32.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "Shop the\nmost modern\nessentials",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                      ),
                    ),
                    SizedBox(height: 16.0),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen()));
                      },
                      child: Icon(
                        Icons.arrow_forward,
                        size: 35.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 16.0,
              bottom: 50.0,
              child: Container(
                child: Row(
                  children: <Widget>[
                    selectedIndicator,
                    unselectedIndicator,
                    unselectedIndicator,
                    unselectedIndicator,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget get selectedIndicator => Container(
        height: 8.0,
        width: 25.0,
        margin: EdgeInsets.only(left: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: Colors.white,
        ),
      );

  Widget get unselectedIndicator => Container(
        height: 8.0,
        width: 8.0,
        margin: EdgeInsets.only(left: 8.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
      );
}
