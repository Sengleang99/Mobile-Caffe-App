import 'package:cafe_app/models/coffee.dart';
import 'package:flutter/material.dart';


class CoffeeShop extends ChangeNotifier {
  // coffee sales list
  final List<Coffee> _shop = [
    Coffee(
        name: 'Ice Latte',
        price: '3.5',
        imageUrl:'lib/images/fda1414f15d51799a3e6d53a00b016ec.png'
    ),

    Coffee(
        name: 'Ice Americano',
        price: '4.0',
        imageUrl:'lib/images/c2e4e62362c0307eeeadf317a1448882.png'
    ),

    Coffee(
        name: 'Ice Capugino',
        price: '3.5',
        imageUrl:'lib/images/50f17c380525acf16c5ad8df185b1554.png'
    ),

    Coffee(
        name: 'Expresso',
        price: '3',
        imageUrl:'lib/images/coffee_offer.png'
    ),
    Coffee(
        name: 'Ice Mocha',
        price: '30',
        imageUrl:'lib/images/coffee_offer.png'
    ),
  ];

  List<Coffee> _userCart = [];

  List<Coffee> get coffeeShop => _shop;

  List<Coffee> get userCart => _userCart;

  void addItemToCart(Coffee coffee){
    _userCart.add(coffee);
    notifyListeners();
  }
  void removeItemFromCart(Coffee coffee){
    _userCart.remove(coffee);
    notifyListeners();
  }
}
