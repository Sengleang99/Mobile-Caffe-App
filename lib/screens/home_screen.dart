import 'package:cafe_app/components/button_nav_bar.dart';
import 'package:cafe_app/screens/cart_screen.dart';
import 'package:cafe_app/screens/shop_screen.dart';
import 'package:cafe_app/screens/user_screen.dart';
import 'package:cafe_app/const.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen ({super.key});

  @override
  State<HomeScreen> createState()=> _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  // navigate bottom bar
  int _selectedIndex = 0;
  void navigateBottomBar(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  // screen
  final List<Widget> _screens = [
    const ShopScreen(),
    const CartScreen(),
    const UserScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: ButtonNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: _screens[_selectedIndex],
    );
  }
}
