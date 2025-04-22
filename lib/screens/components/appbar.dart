import 'package:flutter/material.dart';
import 'package:food_delivery/core/utils/constant.dart';
import 'package:hexcolor/hexcolor.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Icon(Icons.menu),
      title: Column(
        children: [
          Text(
            "Delivery to",
            style: TextStyle(color: HexColor(primaryColor)),
          ),
          Text(
            "My Office",
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 15, color: Colors.grey),
          )
        ],
      ),
      actions: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Icon(
              Icons.mail,
              size: 30,
            ))
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
