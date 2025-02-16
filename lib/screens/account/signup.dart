import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/Resource/Strings.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:food_delivery/core/utils/constant.dart';
import 'package:food_delivery/core/utils/validator.dart';
import 'package:food_delivery/screens/account/header_image.dart';
import 'package:food_delivery/services/api_service.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';

class TurkishStrings extends FlutterPwValidatorStrings {
  @override
  // ignore: overridden_fields
  final String atLeast = 'En az 8 karakter';
  @override
  // ignore: overridden_fields
  final String uppercaseLetters = '1 büyük harf';
  @override
  // ignore: overridden_fields
  final String lowercaseLetters = '1 küçük harf';
  @override
  // ignore: overridden_fields
  final String specialCharacters = '1 özel karakter';
}

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
  bool passwordHasValidate = false;
  String? emailErrorText;
  String? passwordConfirmErrorText;

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
              HeaderImage(
                imagePath: "lib/assets/images/onboarding_first.png",
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Column(
                  spacing: 10,
                  children: [
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
                        errorText: passwordConfirmErrorText,
                      ),
                      onChanged: (value) => confirmPassword(value),
                    ),
                    FlutterPwValidator(
                      width: 400,
                      height: 120,
                      minLength: 8,
                      onSuccess: () {
                        passwordHasValidate = true;
                      },
                      onFail: () {
                        passwordHasValidate = false;
                      },
                      controller: passwordController,
                      uppercaseCharCount: 1,
                      lowercaseCharCount: 1,
                      specialCharCount: 1,
                      strings: TurkishStrings(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
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
                    setState(() {
                      !Validators.isValidEmail(mailController.text)
                          ? emailErrorText = "Geçersiz e-posta adresi"
                          : emailErrorText = null;
                    });
                    _checkErrorAndShowDialog();
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

  confirmPassword(value) {
    setState(() {
      passwordController.text == value
          ? passwordConfirmErrorText = null
          : passwordConfirmErrorText = "Parolalar eşleşmiyor!";
    });
  }

  void _checkErrorAndShowDialog() {
    if (mailController.text == "" ||
        passwordController.text == "" ||
        confirmPasswordController.text == "") {
      showAlertDialog("Tüm alanları dolduğunuza emin olun!");
    } else if (emailErrorText != null) {
      showAlertDialog(emailErrorText);
    } else if (!passwordHasValidate) {
      showAlertDialog("Parolanız gerekli koşulları sağlamıyor!");
    } else if (passwordConfirmErrorText != null) {
      showAlertDialog(passwordConfirmErrorText);
    } else {
      ApiService().registerUser(mailController.text, passwordController.text);
    }
  }

  Widget showAlertDialog(errorText) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Hata"),
          content: Text(errorText!),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dialog'u kapat
              },
              child: Text("Tamam"),
            ),
          ],
        );
      },
    );
    return SizedBox.shrink(); // Return an empty widget
  }
}
