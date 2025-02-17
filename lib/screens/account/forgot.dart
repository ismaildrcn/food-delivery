import 'package:flutter/material.dart';
import 'package:food_delivery/core/utils/constant.dart';
import 'package:food_delivery/core/utils/validator.dart';
import 'package:food_delivery/screens/account/header_image.dart';
import 'package:hexcolor/hexcolor.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController mailController = TextEditingController();
  String? emailErrorText;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back)),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      HeaderImage(
                          imagePath: "lib/assets/images/forgot_password.png"),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: TextField(
                          controller: mailController,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            errorText: emailErrorText,
                            labelText: "Email",
                            filled: true,
                            fillColor: Colors.white,
                            icon: Icon(
                              Icons.email_outlined,
                              color: Colors.grey,
                            ),
                          ),
                          style: TextStyle(backgroundColor: Colors.white),
                        ),
                      ),
                      Spacer(), // Bu widget içeriği en alta iter
                      Padding(
                        padding: const EdgeInsets.only(bottom: 40),
                        child: SizedBox(
                          width: 250,
                          height: 45,
                          child: FilledButton(
                            onPressed: () {
                              setState(() {
                                !Validators.isValidEmail(mailController.text)
                                    ? emailErrorText = "Geçersiz e-posta adresi"
                                    : emailErrorText = null;
                              });
                            },
                            style: FilledButton.styleFrom(
                                backgroundColor: HexColor(primaryColor),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12))),
                            child: const Text(
                              "Send Code",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
