import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 0;

  List<IconData> navBarIcons = [
    Icons.home,
    Icons.search,
    Icons.bookmark,
    Icons.person,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: navBarIcons.map((icon) {
          final itemIndex = navBarIcons.indexOf(icon);
          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = itemIndex;
                });
              },
              child: Container(
                child: Center(
                  child: Icon(
                    icon,
                    color: itemIndex == selectedIndex
                        ? Colors.black
                        : Colors.grey[600],
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
