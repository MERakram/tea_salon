import 'package:flutter/material.dart';

class HorizontalCoffeeCard extends StatelessWidget {
  const HorizontalCoffeeCard({Key? key}) : super(key: key);

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
            const Text('Coffee'),
            SizedBox(
              height: height * 0.01,
            ),
            Text(
              'With milk',
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
                  const Text.rich(
                    TextSpan(
                      text: '\$ ',
                      style:
                          TextStyle(color: Color.fromARGB(255, 209, 119, 66)),
                      children: <InlineSpan>[
                        TextSpan(
                          text: '4.5',
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
