import 'package:flutter/material.dart';
import 'package:tea_salon/components/details_page_appBar.dart';
import 'package:glass_kit/glass_kit.dart';
import '../models/Product.dart';

class Details_page extends StatefulWidget {
  Product product;

  Details_page(this.product);

  @override
  State<Details_page> createState() => _Details_pageState();
}

class _Details_pageState extends State<Details_page> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                details_page_appBar(widget.product),
                Container(
                  margin: EdgeInsets.all(10),
                  height: height * 0.3,
                  width: width - 20,
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    margin: EdgeInsets.only(left: 25, right: 25),
                    child: Stack(
                      children: [
                        Positioned(
                          top: height * 0.13,
                          child: Container(
                            width: width * 0.8,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Description',
                                  style: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text.rich(
                                  TextSpan(
                                    text:
                                        'A cappuccino is a coffee-based drink made primarily'
                                        'from espresso and milk',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                    children: <InlineSpan>[
                                      TextSpan(
                                        text: '... Read More',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.orange),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: height * 0.16,
                  width: width - 20,
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    margin: EdgeInsets.only(left: 25, right: 25, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Size',
                          style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Container(
                              child: Center(
                                child: Text(
                                  'S',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.orange),
                                ),
                              ),
                              height: height * 0.055,
                              width: width * 0.255,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color(0xFF141921),
                                  border: Border.all(color: Colors.orange)),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              child: Center(
                                child: Text(
                                  'M',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.grey[400]),
                                ),
                              ),
                              height: height * 0.055,
                              width: width * 0.255,
                              // width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Color(0xFF141921),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              child: Center(
                                child: Text(
                                  'L',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.grey[400]),
                                ),
                              ),
                              height: height * 0.055,
                              width: width * 0.255,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Color(0xFF141921),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: height * 0.12,
                  width: width - 20,
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    margin: EdgeInsets.only(left: 25, right: 25, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Price',
                              style: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text.rich(
                              TextSpan(
                                text: '\$ ',
                                style: TextStyle(
                                    color: Colors.orange, fontSize: 20),
                                children: <InlineSpan>[
                                  TextSpan(
                                    text: '4.5',
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Container(
                          child: Center(
                            child: Text(
                              'Buy Now',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24),
                            ),
                          ),
                          height: 60,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
            Positioned(
              top: 450,
              left: 10,
              child: GlassContainer.clearGlass(
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.10),
                    Colors.black.withOpacity(0.05)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderGradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.60),
                    Colors.white.withOpacity(0.10),
                    Colors.black.withOpacity(0.05),
                    Colors.black.withOpacity(0.6)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.0, 0.39, 0.40, 1.0],
                ),
                blur: 20,
                height: 150,
                width: width - 20,
                borderRadius: BorderRadius.circular(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Espresso',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          'With Oat Milk',
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.orange,
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text('4.5'),
                            SizedBox(
                              width: 5,
                            ),
                            Text('(634)'),
                          ],
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                          top: 2,
                                          bottom: 10),
                                      child: Image.asset(
                                        'assets/icons/coffee.png',
                                        color: Colors.orange,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 31,
                                    left: 5,
                                    child: Text(
                                      'Coffee',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.grey[400],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              child: Stack(
                                children: [
                                  Positioned(
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          left: 12, right: 12, top: 4),
                                      child: Image.asset(
                                        'assets/icons/milk.png',
                                        color: Colors.orange,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 32,
                                    left: 13,
                                    child: Text(
                                      'Milk',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey[400],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          child: Center(
                            child: Text(
                              'Medium Roasted',
                              style: TextStyle(
                                color: Colors.grey[400],
                              ),
                            ),
                          ),
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
