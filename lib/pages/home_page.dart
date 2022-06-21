// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, unnecessary_null_comparison, prefer_if_null_operators
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tea_salon/components/drink_type_cards.dart';
import 'package:tea_salon/controllers/Add_to_wishlist.dart';
import 'package:tea_salon/controllers/Fetch_Special_Offers.dart';
import 'package:tea_salon/pages/details_page.dart';
import 'package:tea_salon/pages/favorite_page.dart';
import 'package:tea_salon/pages/notification_page.dart';
import 'package:tea_salon/pages/profilelanding.dart';
import '../components/horizontal_coffee_card.dart';
import '../components/vertical_coffee_cards.dart';
import '../controllers/Fetch_Latest_Offers.dart';


class HomePage extends StatefulWidget {
  final fetch_Special_Offers = Get.put(Fetch_Special_Offers());
  final fetch_Latest_Offers = Get.put(Fetch_Latest_Offers());
  final add_to_wishlist_controller = Get.put(Add_to_wishlist_controller());

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List TypesList = [
  //[type,status]
    [
      'Coffee',
      true,
    ],
    [
      'Tea',
      false,
    ],
    [
      'Cocktail',
      false,
    ],
  ];

  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    FavoritePage(),
    NotificationPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  void type_selected(int index) {
    setState(() {
      for(int i=0;i<TypesList.length;i++){
        TypesList[i][1]=false;
      }
      TypesList[index][1]=true;
    });
  }

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
          backgroundColor: Color(0xFF0c0f14),
          appBar: AppBar(
            leading: InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: () => Get.to(ProfileLanding()),
              child: Container(
                margin: EdgeInsets.all(8),
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
                child: Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: SvgPicture.asset(
                    'assets/icons/apps.svg',
                    color: Colors.grey[600],
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ),
            actions: [
              InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () => Get.to(ProfileLanding()),
                child: Container(
                  margin: EdgeInsets.all(8),
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
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SvgPicture.asset(
                      'assets/icons/user.svg',
                      color: Colors.grey[600],
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ),
            ],
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          bottomNavigationBar: BottomNavigationBar(
            iconSize: 26,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: _onItemTapped,
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.transparent,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF141921).withOpacity(1),
                      spreadRadius: -2,
                      blurRadius: 2,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                width: width * 0.9,
                margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset(
                        'assets/icons/search.svg',
                        color: Colors.grey[600],
                        width: 10,
                      ),
                    ),
                    hintText: 'Find your coffee ...',
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Container(
                height: height * 0.06,
                // color: Colors.red,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: TypesList.length,
                  physics: const BouncingScrollPhysics(parent: null),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Drink_type(
                      drink_type: TypesList[index][0],
                      isSelected: TypesList[index][1],
                      onTap: () {
                        type_selected(index);
                      },);
                  },
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              // horiwontal coffee list
              Container(
                height: height * 0.36,
                // color: Colors.green,
                child: GetX<Fetch_Latest_Offers>(builder: (controller) {
                  return ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.productList.length,
                    physics: const BouncingScrollPhysics(parent: null),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: ()=>Get.to(Details_page(controller.productList[index])),
                        child: HorizontalCoffeeCard(
                            controller.productList[index].id,
                            controller.productList[index].productName,
                            controller.productList[index].productImage,
                            controller.productList[index].productDescription,
                            controller.productList[index].price),
                      );
                    },
                  );
                }),
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
              GetX<Fetch_Special_Offers>(builder: (controller) {
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
              }),
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
              },
            ),
          ),
        ),
      ),
    );
  }
}
