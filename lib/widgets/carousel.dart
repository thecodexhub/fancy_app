import 'package:flutter/material.dart';

class Carousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.0,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'images/cover.jpg',
            fit: BoxFit.cover,
          ),
          Container(
            height: 180.0,
            width: MediaQuery.of(context).size.width,
            color: Colors.black.withOpacity(0.4),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Spring Collection",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'OpenSans',
                    letterSpacing: 0.5,
                  ),
                ),
                Text(
                  "50+ Designer Brands",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                    fontFamily: 'OpenSans',
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 16.0,
            right: 12.0,
            child: Row(
              children: <Widget>[
                unselectedIndicator,
                unselectedIndicator,
                selectedIndicator,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget get selectedIndicator => Container(
        height: 8.0,
        width: 8.0,
        margin: EdgeInsets.only(left: 10.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
      );

  Widget get unselectedIndicator => Container(
        height: 8.0,
        width: 8.0,
        margin: EdgeInsets.only(left: 10.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[400],
        ),
      );
}
