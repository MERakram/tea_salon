import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
  int _currentPage = 0;

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
                  onPageChanged: (index, reason) {
                    _currentPage = index;
                  }),
              itemCount: images.length,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                final image = images[index];
                return imageBuilder(image, index);
              },
            ),
          ),
          Positioned(
            child: Container(
              padding: EdgeInsets.only(top: 50, left: 25, right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        colors: [
                         Colors.white10,
                         Colors.white10,
                          Colors.black12,
                          Colors.black54,
                          Colors.black87,
                          Colors.black,
                          Colors.black,
                          Colors.black,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    padding: EdgeInsets.all(6),
                    child: SvgPicture.asset(
                      'assets/icons/apps.svg',
                      color: Colors.grey[600],
                      fit: BoxFit.scaleDown,
                      height: 25,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF262a33).withOpacity(1),
                          Color(0xFF262a33).withOpacity(0.8),
                          Color(0xFF262a33).withOpacity(0.6),
                          Color(0xFF262a33).withOpacity(0.2),
                          Color(0xFF262a33).withOpacity(0.1),
                          Color(0xFF262a33).withOpacity(0.05),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(4),
                    child: SvgPicture.asset(
                      'assets/icons/apps.svg',
                      color: Colors.grey[600],
                      fit: BoxFit.scaleDown,
                      height: 25,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget imageBuilder(String image, int index) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        image: DecorationImage(
          image: AssetImage(widget.product.productImage.toString()),
          fit: BoxFit.cover,
        ),
        boxShadow: [
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
