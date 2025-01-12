import 'package:cafe_app/authentication/signin.dart';
import 'package:flutter/material.dart';

class GetStartScreen extends StatefulWidget {
  const GetStartScreen({super.key});

  @override
  State<GetStartScreen> createState() => _GetStartScreenState();
}

class _GetStartScreenState extends State<GetStartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // Prevent overflow
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.asset(
                "lib/images/9b64f2ac21ea2c0e31021341ab358235-removebg-preview.png",
                height: 430,
                width: 430,
              ),
            ),
            const Text(
              'Coffee For You',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            ),
            const Text(
              'Have a good time at any time',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const Text(
              'with your coffee',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6F4E37),
                padding:
                const EdgeInsets.symmetric(horizontal: 100, vertical: 18),
              ),
              onPressed: () {
                // Navigate to SignInApp without loading screen
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SignInScreen()), // Replace this with your SignInApp widget
                );
              },
              child: const Text(
                "Drink Coffee",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
