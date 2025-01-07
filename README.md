# cafe_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



import 'package:cafe_app/components/cafe_title.dart';
import 'package:cafe_app/models/coffee.dart';
import 'package:cafe_app/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopScreen extends StatefulWidget {
const ShopScreen({super.key});

@override
State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {

void addToCart(Coffee coffee){

    Provider.of<CoffeeShop>(context, listen: false).addItemToCart(coffee);
    
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text('Add to cart successfully!!', style: TextStyle(fontSize: 20),),
        )
    );
}


@override
Widget build(BuildContext context) {
return Consumer<CoffeeShop>(
builder: (context, value, child) => SafeArea(
child: Padding(
padding: const EdgeInsets.all(25.0),
child: Column(
children: [
const Text(
'How would you like coffee?',
style: TextStyle(fontSize: 20),
),
const SizedBox(height: 25),
Expanded(
child: ListView.builder(
itemCount: value.coffeeShop.length,
itemBuilder: (context, index) {
Coffee eachCoffee = value.coffeeShop[index];
return CoffeeTitle(
coffee: eachCoffee,
icon: const Icon(Icons.arrow_forward),
onPressed: () => addToCart(eachCoffee),
);
},
),
),
],
),
),
),
);
}
}
