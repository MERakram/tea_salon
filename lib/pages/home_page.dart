// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tea_salon/controllers/FetchData.dart';
import 'package:tea_salon/pages/favorite_page.dart';
import 'package:tea_salon/pages/notification_page.dart';
import '../components/horizontal_coffee_card.dart';
import '../components/vertical_coffee_cards.dart';
import 'ProfilePage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    FavoritePage(),
    NotificationPage()
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    final fetchData = Get.put(FetchData());
    Size size = MediaQuery.of(context).size;
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
          backgroundColor: Color.fromARGB(255, 12, 15, 20),
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
                        'assets/images/search.svg',
                        color: Colors.grey[600],
                        width: 10,
                      ),
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
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  physics: const BouncingScrollPhysics(parent: null),
                  itemBuilder: (BuildContext context, int index) {
                    return HorizontalCoffeeCard();
                  },
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
              ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: 4,
                physics: const BouncingScrollPhysics(parent: null),
                itemBuilder: (BuildContext context, int index) {
                  return VerticalCoffeeCard();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
