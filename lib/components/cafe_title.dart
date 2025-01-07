import 'package:flutter/material.dart';
import '../models/coffee.dart';

class CoffeeTitle extends StatelessWidget {
  // Declare a member variable to hold the Coffee object
  final Coffee coffee;
  void Function()? onPressed;
  final Widget icon;
  // Constructor to initialize the Coffee object
  CoffeeTitle({super.key, required this.coffee, required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12)
      ),
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
      child: ListTile(
        title: Text(coffee.name), // Accessing coffee.name
        subtitle: Text(coffee.price.toString()), // Accessing coffee.price
        leading: Image.asset(coffee.imageUrl),
        trailing: IconButton(
            onPressed: onPressed ,
          icon: icon,
        ),
      ),
    );
  }
}
