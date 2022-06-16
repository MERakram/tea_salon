// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tea_salon/controllers/Add_to_wishlist.dart';
import 'package:tea_salon/controllers/Fetch_Special_Offers.dart';

import '../components/horizontal_coffee_card.dart';
import '../components/vertical_coffee_cards.dart';
import '../controllers/Fetch_Latest_Offers.dart';
import 'ProfilePage.dart';

class HomePage extends StatelessWidget {
  final fetch_Special_Offers = Get.put(Fetch_Special_Offers());
  final fetch_Latest_Offers = Get.put(Fetch_Latest_Offers());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    double height = size.height;
    double width = size.width;
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.grey[900],
          appBar: AppBar(
            leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
            actions: [
              IconButton(
                  onPressed: () {
                    Get.to(ProfilePage());
                  },
                  icon: Icon(Icons.person))
            ],
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.notifications), label: ''),
            ],
          ),
          body: ListView(
            shrinkWrap: true,
            children: [
              // best coffee for you
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.065),
                child: Text(
                  'Find the best coffee for you',
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              // search bar
              Container(
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset(
                        'assets/images/search.svg', color: Colors.grey[600],
                        width: 10,),
                    ),
                    hintText: 'Find your coffee ...',
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.transparent,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF777676).withOpacity(0.1),
                      spreadRadius: -2,
                      blurRadius: 2,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                width: width * 0.9,
                margin: EdgeInsets.symmetric(horizontal: width * 0.05),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              // horiwontal coffee list
              Container(
                height: height * 0.41,
                // color: Colors.green,
                child: GetX<Fetch_Latest_Offers>(
                  builder: (controller) {
                    return ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.productList.length,
                      physics: const BouncingScrollPhysics(parent: null),
                      itemBuilder: (BuildContext context, int index) {
                        return HorizontalCoffeeCard(
                            controller.productList[index].id,
                            controller.productList[index].productName,
                            controller.productList[index].productImage,
                            controller.productList[index].productDescription,
                            controller.productList[index].price);
                      },
                    );
                  }
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.07),
                child: Text(
                  'For You',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              GetX<Fetch_Special_Offers>(
                  builder: (controller) {
                    return ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: controller.productList.length,
                      physics: const BouncingScrollPhysics(parent: null),
                      itemBuilder: (BuildContext context, int index) {
                        return VerticalCoffeeCard(
                            controller.productList[index].id,
                            controller.productList[index].productName,
                            controller.productList[index].productImage,
                            controller.productList[index].productDescription,
                            controller.productList[index].price);
                      },
                    );
                  }
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton.extended(
            //chekout
              onPressed: () {},
              backgroundColor: Colors.orange,
              icon: Icon(Icons.add_shopping_cart_rounded),
              label: GetX<Add_to_wishlist_controller>(
                builder: (controller) {
                  return Text(controller.totalPrice.toString());
                }
              )),
        ),
      ),
    );
  }
}
