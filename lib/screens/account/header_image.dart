import 'package:flutter/material.dart';

class HeaderImage extends StatelessWidget {
  final String imagePath;
  final double width;
  final double height;

  const HeaderImage({
    super.key,
    required this.imagePath,
    this.width = 240,
    this.height = 292,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }
}
