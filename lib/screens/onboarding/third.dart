import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/core/utils/constant.dart';
import 'package:hexcolor/hexcolor.dart';

class OnbordingThird extends StatelessWidget {
  const OnbordingThird({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 120),
                  child: Container(
                      width: 240,
                      height: 292,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              "lib/assets/images/onboarding_third.png"),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      )),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      "Free delivery offers",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      "Get all your loved foods in one once place, you just place the orer we do the rest",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[800],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: DotsIndicator(
                  dotsCount: 3,
                  position: 2,
                  decorator: DotsDecorator(
                    color: Colors.grey, // Inactive color
                    activeColor: HexColor(primaryColor),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 250,
                        height: 50,
                        child: FilledButton(
                          onPressed: () {},
                          style: FilledButton.styleFrom(
                            backgroundColor: HexColor(primaryColor),
                          ),
                          child: const Text(
                            "Get Started",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
