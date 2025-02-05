import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/constant/constant.dart';
import 'package:food_delivery/screens/account/header_image.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  String? emailErrorText;

  bool isValidEmail(String email) {
    // Geçerli bir e-posta adresi için düzenli ifade
    String pattern = r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$";
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back)),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              HeaderImage(imagePath: "lib/assets/images/onboarding_first.png"),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Column(
                  spacing: 10,
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: "Name",
                        hintText: "İsmail Durcan",
                        icon: Icon(
                          Icons.contact_emergency_outlined,
                          color: Colors.grey,
                        ),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                      ),
                    ),
                    TextField(
                      controller: mailController,
                      decoration: InputDecoration(
                        errorText: emailErrorText,
                        labelText: "Email",
                        hintText: "ismail@example.com",
                        icon: Icon(
                          Icons.mail_outline,
                          color: Colors.grey,
                        ),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                      ),
                    ),
                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: "Password",
                        icon: Icon(
                          Icons.password,
                          color: Colors.grey,
                        ),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                      ),
                    ),
                    TextField(
                      controller: confirmPasswordController,
                      decoration: InputDecoration(
                        labelText: "Confirm Password",
                        icon: Icon(
                          Icons.password,
                          color: Colors.grey,
                        ),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "By signing up, you're agree to our ",
                      style: TextStyle(color: Colors.grey)),
                  TextSpan(
                      text: "Terms & Conditions",
                      style: TextStyle(color: HexColor(primaryColor)),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          launchUrl(Uri.parse("https://google.com"));
                        }),
                  TextSpan(text: " and ", style: TextStyle(color: Colors.grey)),
                  TextSpan(
                      text: "Privacy Policy",
                      style: TextStyle(color: HexColor(primaryColor)),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          launchUrl(Uri.parse("https://teknomercek.com"));
                        }),
                ])),
              ),
              SizedBox(
                width: 250,
                height: 45,
                child: FilledButton(
                  onPressed: () {
                    if (!isValidEmail(mailController.text)) {
                      setState(() {
                        emailErrorText = "Geçersiz e-posta adresi";
                      });
                    }
                  },
                  style: FilledButton.styleFrom(
                      backgroundColor: HexColor(primaryColor),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                  child: const Text(
                    "Continue",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Joined us before?",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[500]),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("LOGIN",
                          style: TextStyle(
                              fontSize: 15, color: HexColor(primaryColor))))
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
