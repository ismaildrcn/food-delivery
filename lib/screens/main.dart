import 'package:flutter/material.dart';
import 'package:food_delivery/screens/components/appbar.dart';

class MyArea extends StatelessWidget {
  const MyArea({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: CustomAppBar(),
        body: Column(),
      ),
    );
  }
}
