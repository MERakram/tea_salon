import 'package:flutter/material.dart';

class Drink_type extends StatelessWidget {
  final String drink_type;
  final bool isSelected;
  final VoidCallback onTap;

  Drink_type(
      {required this.drink_type,
      required this.isSelected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    final Style1 = TextStyle(
      fontFamily: 'Raleway bold',
      fontWeight: FontWeight.w900,
      fontSize: 22,
      color:
          isSelected ? Colors.orange : const Color.fromARGB(255, 207, 207, 207),
    );
    final Style2 = TextStyle(
      fontFamily: 'Raleway bold',
      fontWeight: FontWeight.w900,
      fontSize: 50,
      color:
      isSelected ? Colors.orange : const Color.fromARGB(255, 207, 207, 207),
    );
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    // TODO: implement build
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: onTap,
      child: Container(
          margin: EdgeInsets.only(
            left: width * 0.07,
            right: width * 0.07,
            top: height * 0.006,
          ),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Positioned(
                child: Text(
                  drink_type,
                  style: Style1,
                ),
              ),
              Positioned(
                top: -15,
                child: Text(
                  '.',
                  style: Style2,
                ),
              ),
            ],
          )),
    );
  }
}
