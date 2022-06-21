import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/Fetch_Latest_Offers.dart';
import '../models/Product.dart';

class details_page_appBar extends StatefulWidget {
  Product product;
  final fetch_Latest_Offers = Get.put(Fetch_Latest_Offers());
  details_page_appBar(this.product);
  @override
  _details_page_appBarState createState() {
    return _details_page_appBarState();
  }
}

class _details_page_appBarState extends State<details_page_appBar> {
  List images = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1g7H2Qcse7nhXqoLTx7STDxh5dPIcArxZqQ&usqp=CAU'
  ];
  final CarouselController _controller = CarouselController();
  int _currentPage=0;
  @override
  void initState() {
    super.initState();
    // setImages();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Stack(
        children: [
          Container(
            child: CarouselSlider.builder(
              carouselController: _controller,
              options: CarouselOptions(
                height: 500,
                viewportFraction: 1,
                onPageChanged: (index,reason){
                  _currentPage=index;
                }
              ),
              itemCount: images.length,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                final image = images[index];
                return imageBuilder(image,index);
              },
            ),
          )
        ],
      ),
    );
  }
  Widget imageBuilder(String image, int index){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        image: DecorationImage(
          image:AssetImage(widget.product.productImage.toString()),
          fit: BoxFit.cover,
        ),
        boxShadow:[
          BoxShadow(
            color: const Color(0xFF605F5F).withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
    );
  }
}
