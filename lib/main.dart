import 'package:flutter/material.dart';
// import 'package:food_delivery/screens/account/login.dart';
import 'package:food_delivery/screens/main.dart';
// import 'package:food_delivery/screens/onboarding/first.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyArea(),
    );
  }
}
