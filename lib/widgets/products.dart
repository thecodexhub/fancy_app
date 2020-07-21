import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  List<ProductItem> items = [
    ProductItem(
      imageUrl: 'images/product1.jpg',
      productType: 'Mink',
      productName: 'Spring Dress',
      productPrice: "44.99",
      favorite: true,
      newProduct: true,
    ),
    ProductItem(
      imageUrl: 'images/product2.jpg',
      productType: 'Mink',
      productName: 'Spring Black Top',
      productPrice: "44.99",
      favorite: false,
      newProduct: false,
    ),
    ProductItem(
      imageUrl: 'images/product3.jpg',
      productType: 'Mink',
      productName: 'Spring Dress',
      productPrice: "44.99",
      favorite: false,
      newProduct: false,
    ),
    ProductItem(
      imageUrl: 'images/product4.jpg',
      productType: 'Mink',
      productName: 'Spring Black Top',
      productPrice: "44.99",
      favorite: false,
      newProduct: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 7 / 12),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Image with favorite button and new stamp
                imageContent(
                    index, items[index].favorite, items[index].newProduct),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(items[index].productType.toUpperCase()),
                        Text(
                          items[index].productName,
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans'),
                        ),
                        Text(
                          '\$ ${items[index].productPrice}',
                          style: TextStyle(
                              fontSize: 13.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget imageContent(int index, bool favorite, bool newProduct) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: AspectRatio(
        aspectRatio: 3 / 4,
        child: Stack(
          children: <Widget>[
            Image.asset(
              items[index].imageUrl,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
              right: 12.0,
              top: 12.0,
              child: Container(
                height: 30.0,
                width: 30.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.favorite,
                    color: favorite ? Colors.red[600] : Colors.grey[400],
                    size: 15.0,
                  ),
                ),
              ),
            ),
            newProduct
                ? Positioned(
                    bottom: 12.0,
                    left: 12.0,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.white,
                      ),
                      child: Text(
                        'New',
                        style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans'),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}

class ProductItem {
  ProductItem(
      {this.imageUrl,
      this.productType,
      this.productName,
      this.productPrice,
      this.favorite,
      this.newProduct});
  final String imageUrl;
  final String productType;
  final String productName;
  final String productPrice;
  final bool favorite;
  final bool newProduct;
}
