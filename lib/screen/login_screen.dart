import 'package:codeproj/screen/home_screen.dart';
import 'package:codeproj/screen/signup_screen.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyLoginPage extends StatefulWidget {
  MyLoginPage({
    super.key,
  });

  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            color: Colors.white,
            child: Stack(
              children: [
                Positioned(
                  top: 170,
                  left: 250,
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(
                        'assets/icons/coronavirus.png',
                      ),
                    )),
                  ),
                ),
                Positioned(
                  top: -70,
                  left: -70,
                  child: Container(
                    height: 250,
                    width: 250,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        // borderRadius: BorderRadius.all(Radius.circular(50)),
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.blue.shade100.withOpacity(0.7),
                              Colors.green.shade200.withOpacity(0.7),
                            ])),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 300,
                      ),
                      const Spacer(),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: const EdgeInsets.only(left: 40),
                            child: const Text(
                              'Covid 19',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Color.fromARGB(255, 63, 164, 107),
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              gradient: LinearGradient(colors: [
                                Colors.yellow.shade100,
                                Colors.green.shade100,
                                Colors.blue.shade50
                              ])),
                          margin: const EdgeInsets.only(
                              left: 32, bottom: 32, right: 32, top: 3),
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              buildTextFieldEmail(),
                              buildTextFieldPassword(),
                              buildButtonSignIn(),
                              buildOtherLine(),
                              buildButtonRegister(),
                            ],
                          )),
                      const Spacer(),
                    ],
                  ),
                ),
              ],
            )));
  }

  buildButtonSignIn() {
    return InkWell(
      onTap: () {
        signIn();
      },
      child: Container(
          constraints: const BoxConstraints.expand(height: 50),
          child: const Text("Sign in",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.white)),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.green[200]),
          margin: const EdgeInsets.only(top: 16),
          padding: const EdgeInsets.all(12)),
    );
  }

  signIn() async {
    await _auth
        .signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    )
        .then((user) {
      print("signed in ${user.user?.email}");
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const MyHomePage()));
    }).catchError((error) {
      print(error.message);

      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Email or Password is wrong.")));
    });
  }

  buildTextFieldEmail() {
    return Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.yellow[50], borderRadius: BorderRadius.circular(16)),
        child: TextField(
            controller: emailController,
            decoration: const InputDecoration.collapsed(hintText: "Email"),
            style: const TextStyle(fontSize: 18)));
  }

  buildTextFieldPassword() {
    return Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(top: 12),
        decoration: BoxDecoration(
            color: Colors.yellow[50], borderRadius: BorderRadius.circular(16)),
        child: TextField(
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration.collapsed(hintText: "Password"),
            style: const TextStyle(fontSize: 18)));
  }

  buildOtherLine() {
    return Container(
        margin: const EdgeInsets.only(top: 16),
        child: Row(children: <Widget>[
          Expanded(child: Divider(color: Colors.green[800])),
          const Padding(
              padding: EdgeInsets.all(6),
              child: Text("Don't have an account?",
                  style: TextStyle(color: Colors.black87))),
          Expanded(child: Divider(color: Colors.green[800])),
        ]));
  }

  buildButtonRegister() {
    return InkWell(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => const SingUpScreen())),
      child: Container(
          constraints: const BoxConstraints.expand(height: 50),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.orange[200]),
          margin: const EdgeInsets.only(top: 12),
          padding: const EdgeInsets.all(12),
          child: const Text("Sign up",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.white))),
    );
  }
}
