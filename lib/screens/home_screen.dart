import 'package:flutter/material.dart';
import 'package:fancyapp/widgets/carousel.dart';
import 'package:fancyapp/widgets/products.dart';
import 'package:fancyapp/widgets/bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedindex = 0;

  final List<String> items = [
    "Everything",
    "Jackets",
    "Blazers",
    "Dresses",
    "Top"
  ];

  Widget _buildItems(String item, bool isSelected) {
    return Container(
      margin: EdgeInsets.only(right: 5.0),
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        color: isSelected ? Colors.grey[600] : Colors.grey[100],
      ),
      child: Text(
        item,
        style: TextStyle(
          fontSize: 14.0,
          color: isSelected ? Colors.white : Colors.grey[800],
          fontWeight: FontWeight.w600,
          fontFamily: 'OpenSans',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        leading: Icon(
          Icons.sort,
          color: Colors.black,
          size: 27.0,
        ),
        title: Text(
          'Fancy',
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontFamily: 'OpenSans',
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Container(
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Icon(
                      Icons.favorite,
                      color: Colors.grey[800],
                    ),
                  ),
                  Positioned(
                    right: 0.0,
                    bottom: 32.0,
                    child: Container(
                      height: 8.0,
                      width: 8.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(
              Icons.shopping_basket,
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Carousel(),
            header,
            Container(
              height: 55.0,
              padding: EdgeInsets.all(8.0),
              color: Colors.grey[100],
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedindex = index;
                      });
                    },
                    child: _buildItems(items[index], selectedindex == index),
                  );
                },
              ),
            ),
            Products(),
          ],
        ),
      ),
    );
  }

  Widget get header => Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Women's Clothing",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OpenSans',
                  ),
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'FILTER',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'OpenSans',
                      ),
                    ),
                    SizedBox(width: 3.0),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                      size: 16.0,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 2.0),
            Text(
              "7743 items found",
              style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w600,
                  fontFamily: 'OpenSans'),
            ),
          ],
        ),
      );
}
