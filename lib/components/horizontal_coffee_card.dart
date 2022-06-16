import 'package:flutter/material.dart';

class HorizontalCoffeeCard extends StatefulWidget {
  final int id;
  final String productName;
  final String productImage;
  final String productDescription;
  final double price;
  HorizontalCoffeeCard(this.id, this.productName, this.productImage, this.productDescription, this.price);

  @override
  State<HorizontalCoffeeCard> createState() => _HorizontalCoffeeCardState();
}

class _HorizontalCoffeeCardState extends State<HorizontalCoffeeCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Padding(
      padding: EdgeInsets.only(left: width * 0.06),
      child: Container(
        padding: const EdgeInsets.all(18),
        width: width * 0.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromARGB(255, 17, 20, 25),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: width * 0.45,
              width: width * 0.45,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/coffee.jpg',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),

            Text(widget.productName),
             SizedBox(
              height: height*0.01,

            ),
            Text(
              widget.productDescription,
              style: TextStyle(color: Colors.grey[500]),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                   Text.rich(

                    TextSpan(
                      text: '\$ ',
                      style:
                          TextStyle(color: Color.fromARGB(255, 209, 119, 66)),
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
    );
  }
}
