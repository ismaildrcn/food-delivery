import 'package:flutter/material.dart';
import 'package:food_delivery/constant/constant.dart';
import 'package:hexcolor/hexcolor.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // Initially password is obscure
  bool _obscureText = true;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: Container(
                        width: 240,
                        height: 292,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                "lib/assets/images/onboarding_first.png"),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        )),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    spacing: 10,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Login",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          spacing: 15,
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: TextField(
                                  controller: mailController,
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(),
                                    labelText: "Email",
                                    filled: true,
                                    fillColor: Colors.white,
                                    icon: Icon(Icons.email_outlined),
                                  ),
                                  style:
                                      TextStyle(backgroundColor: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          spacing: 15,
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: TextField(
                                  controller: passwordController,
                                  obscureText: _obscureText,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    labelText: 'Password',
                                    icon: Icon(Icons.password),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        // Based on passwordVisible state choose the icon
                                        _obscureText
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: Colors.grey[400],
                                      ),
                                      onPressed: _toggle,
                                    ),
                                  ),
                                  style:
                                      TextStyle(backgroundColor: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "Forgot Button?",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: HexColor(primaryColor)),
                              ))),
                      SizedBox(
                        width: 250,
                        height: 45,
                        child: FilledButton(
                          onPressed: () {
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) => {}));
                          },
                          style: FilledButton.styleFrom(
                              backgroundColor: HexColor(primaryColor),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
                          child: const Text(
                            "Login",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Divider(
                              thickness: 2,
                              indent: 0,
                              endIndent: 0,
                              color: Colors.grey[200]),
                          Container(
                            color:
                                Colors.white, // Arka plan rengi uyarlanabilir
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Text(
                              "OR",
                              style: TextStyle(color: Colors.grey[500]),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 250,
                        height: 45,
                        child: FilledButton(
                          onPressed: () {
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) => {}));
                          },
                          style: FilledButton.styleFrom(
                              backgroundColor: HexColor("F0F5FA"),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
                          child: Row(
                            spacing: 20,
                            children: [
                              Image.asset(
                                "lib/assets/images/google.png",
                                width: 25,
                                height: 25,
                              ),
                              const Text(
                                "Login with Google",
                                style:
                                    TextStyle(fontSize: 18, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: TextStyle(fontSize: 15),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "SIGN UP",
                                style: TextStyle(
                                    color: HexColor(primaryColor),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
