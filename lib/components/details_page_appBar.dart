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
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
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
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(12),
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF262a33).withOpacity(1),
                            Color(0xFF262a33).withOpacity(1),
                            Color(0xFF262a33).withOpacity(0.6),
                            Color(0xFF262a33).withOpacity(0.2),
                            Color(0xFF262a33).withOpacity(0.1),
                            Color(0xFF262a33).withOpacity(0.05),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      padding: EdgeInsets.all(8),
                      child: SvgPicture.asset(
                        'assets/icons/back.svg',
                        color: Colors.grey[600],
                        fit: BoxFit.scaleDown,
                        height: 25,
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color(0xFF0c0f14),
                    ),
                  ),
                  Container(
                    child: Container(
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
                      padding: EdgeInsets.all(8),
                      child: SvgPicture.asset(
                        'assets/icons/heart.svg',
                        color: Colors.grey[600],
                        fit: BoxFit.scaleDown,
                        height: 25,
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color(0xFF0c0f14),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: height * 0.5,
            left: width / 2.2,
            child: Row(
              children: [
                Container(
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 6),
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(
                    color: Color(0xFF757575),
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 6),
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(
                    color: Color(0xFF757575),
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ),
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
