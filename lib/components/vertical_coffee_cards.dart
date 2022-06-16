import 'dart:ui';

import 'package:flutter/material.dart';

class VerticalCoffeeCard extends StatelessWidget {
  const VerticalCoffeeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Padding(
      padding: EdgeInsets.only(left: width * 0.06, right: width * 0.06),
      child: Container(
        margin: EdgeInsets.only(bottom: height * 0.01),
        padding: const EdgeInsets.all(18),
        height: height * 0.2,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 37, 43, 51),
            ),
            BoxShadow(
                offset: Offset.fromDirection(5, 0),
                color: Color.fromARGB(255, 17, 20, 25),
                blurRadius: 20,
                spreadRadius: -10)
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 1,
              child: Container(
                height: height * 0.25,
                width: width * 0.25,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/coffee.jpg',
                    scale: 4,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: width * 0.02,
            ),
            Flexible(
              flex: 2,
              child: Container(
                // color: Colors.deepPurpleAccent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: width * 0.02),
                      child: const Text('Coffee'),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: width * 0.02),
                      child: Text(
                        'With milk',
                        style: TextStyle(color: Colors.grey[500]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text.rich(
                            TextSpan(
                              text: '\$ ',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 209, 119, 66)),
                              children: <InlineSpan>[
                                TextSpan(
                                  text: '4.5',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(255, 209, 119, 66)),
                            child: const Icon(
                              Icons.add,
                            ),
                          ),
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
    );
  }
}
