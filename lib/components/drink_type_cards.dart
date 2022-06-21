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
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: isSelected ? Colors.orange : const Color.fromARGB(255, 207, 207, 207)),
                ),
              ),
              Positioned(
                top: -15,
                child: Text(
                  '.',
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: isSelected ? Colors.orange : const Color.fromARGB(255, 207, 207, 207)),
                ),
              ),
            ],
          )),
    );
  }
}
