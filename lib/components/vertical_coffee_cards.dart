import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tea_salon/controllers/Add_to_wishlist.dart';
import 'package:tea_salon/models/Product.dart';

class VerticalCoffeeCard extends StatefulWidget {
  final int id;
  final String productName;
  final String productImage;
  final String productDescription;
  final double price;

  VerticalCoffeeCard(this.id, this.productName, this.productImage,
      this.productDescription, this.price);

  @override
  State<VerticalCoffeeCard> createState() => _VerticalCoffeeCardState();
}

class _VerticalCoffeeCardState extends State<VerticalCoffeeCard> {
  final add_to_wishlist_controller = Get.put(Add_to_wishlist_controller());

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
          gradient: LinearGradient(
            colors: [
              Color(0xFF262a33).withOpacity(0.8),
              Color(0xFF262a33).withOpacity(0.6),
              Color(0xFF262a33).withOpacity(0.4),
              Color(0xFF262a33).withOpacity(0.4),
              Color(0xFF262a33).withOpacity(0.1),
              Color(0xFF262a33).withOpacity(0.05),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
          ),
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
                      child: Text(widget.productName),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: width * 0.02),
                      child: Text(
                        widget.productDescription,
                        style: TextStyle(color: Colors.grey[500]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text.rich(
                            TextSpan(
                              text: '\$ ',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 209, 119, 66)),
                              children: <InlineSpan>[
                                TextSpan(
                                  text: widget.price.toString(),
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.lightGreenAccent,
                            onTap: () {
                              add_to_wishlist_controller.addToWishlist(Product(
                                  widget.id,
                                  widget.productName,
                                  widget.productImage,
                                  widget.productDescription,
                                  widget.price));
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.orange,
                              ),
                              child: Icon(
                                Icons.add,
                              ),
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
