import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/models/malls/malls.dart';
import 'package:untitled3/modules/shop_account/accout.dart';
import 'package:untitled3/modules/shop_home/home_shop.dart';
import 'package:untitled3/modules/shopping_basket/basket.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ShopHomeScreen extends StatefulWidget {
  const ShopHomeScreen({Key? key}) : super(key: key);

  @override
  State<ShopHomeScreen> createState() => _ShopHomeScreenState();
}



var scaffoldkeey = GlobalKey<ScaffoldState>();

int currentIndex = 0;

var titleController = TextEditingController();

List<Widget> screens =
[
  HomeShop(),
  AccountShop(),
  BasketShop(),
];

List<String> titles =
[
  "Home",
  "Account Shop",
  "Basket Shop",
];

class _ShopHomeScreenState extends State<ShopHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkeey,
      appBar: AppBar(
          backgroundColor: Color(0xfff5c855),
          actions: [
            IconButton(
              icon: Icon(
                Icons.search,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.menu,
              ),
              onPressed: () {},
            ),
          ],
          title: Row(
            children: [
              // Text(
              //   titles[currentIndex],
              // ),
              Image(
                image: AssetImage('assets/images/home2.png'),
                width: 100,
                height: 70,
              ),
            ],
          )

      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // only fixed
        // elevation: 5.0,
        currentIndex: currentIndex, // the page u open
        onTap: (index)
        {
          setState(() {
            currentIndex = index;
          });
        },
        items:
        [
          BottomNavigationBarItem(icon:
          Icon(
            Icons.home,
          ),
            label: "Home",
          ),
          BottomNavigationBarItem(icon:
          Icon(
            Icons.account_circle,
          ),
            label: "Account",
          ),
          BottomNavigationBarItem(icon:
          Icon(
            Icons.shopping_basket_sharp,
          ),
            label: "Basket",
          ),
        ],
      ),

    );
  }
}

