import 'package:flutter/material.dart';
import 'package:tea_salon/components/details_page_appBar.dart';

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
        child: Column(
          children: [
            details_page_appBar(widget.product),
          ],
        ),
      ),
    );
  }
}
