import 'package:cafe_app/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/coffee.dart';

class OrderDetail extends StatefulWidget {
  final Coffee coffee;

  const OrderDetail({super.key, required this.coffee});

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  int quantity = 1;
  String selectedSize = "S";

  void addToCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).addItemToCart(coffee);

    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text(
          'Add to cart successfully!!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    ).then((_) {
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.pop(context); // Close the dialog after 1 second
      });
    });
  }



  void payNow() {
    print("Pay Now clicked with quantity: $quantity, size: $selectedSize, and coffee: ${widget.coffee.name}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                widget.coffee.imageUrl.isNotEmpty ? widget.coffee.imageUrl : 'assets/images/placeholder.jpg',
                height: 120,
              ),
              const SizedBox(height: 20),
              Text(widget.coffee.name,
                  style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 32, color: Colors.grey)),
              Text('\$${widget.coffee.price}',
                  style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 32, color: Colors.grey)),
              const SizedBox(height: 20),
              const Text('QUANTITY',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500, color: Colors.grey)),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (quantity > 1) quantity--;
                      });
                    },
                    icon: const Icon(Icons.remove),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 28),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text('$quantity', style: const TextStyle(fontSize: 24)),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        quantity++;
                      });
                    },
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text('SIZE',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500, color: Colors.grey)),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSizeOption('S'),
                  const SizedBox(width: 10),
                  _buildSizeOption('M'),
                  const SizedBox(width: 10),
                  _buildSizeOption('L'),
                ],
              ),
              const SizedBox(height: 40),
              GestureDetector(
                onTap: payNow,
                child: Container(
                  padding: const EdgeInsets.all(15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Text(
                      'Add to Cart',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSizeOption(String size) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSize = size;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        decoration: BoxDecoration(
          color: selectedSize == size ? Colors.brown : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(45),
        ),
        child: Text(
          size,
          style: TextStyle(
            fontSize: 16,
            color: selectedSize == size ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
