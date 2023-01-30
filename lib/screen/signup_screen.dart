import 'dart:ui';

import 'package:codeproj/screen/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key});

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
            color: Colors.white,
            child: Center(
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(colors: [
                        Colors.yellow.shade100,
                        Colors.green.shade100,
                        Colors.blue.shade50,
                      ])),
                  margin: const EdgeInsets.all(32),
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      buildTextFieldEmail(),
                      buildTextFieldPassword(),
                      buildTextFieldPasswordConfirm(),
                      buildButtonSignUp(context)
                    ],
                  )),
            )),
        ClipPath(
          clipper: HeadRightClipper(),
          child: Container(
            height: 250,
            color: Colors.green.shade400.withOpacity(0.4),
          ),
        ),
        ClipPath(
          clipper: HeadClipper(),
          child: Container(
            height: 250,
            color: Colors.blue.shade300.withOpacity(0.4),
          ),
        ),
        Positioned(
          top: 40.0,
          left: 3.0,
          child: IconButton(
            onPressed: (() => Navigator.of(context).pop()),
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.blueGrey.shade900,
            ),
          ),
        ),
      ],
    ));
  }

  buildButtonSignUp(BuildContext context) {
    return InkWell(
      onTap: () => signUp(),
      child: Container(
          constraints: const BoxConstraints.expand(height: 50),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.green[200]),
          margin: const EdgeInsets.only(top: 16),
          padding: const EdgeInsets.all(12),
          child: const Text("Sign up",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.white))),
    );
  }

  signUp() {
    print("tap ok");
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmController.text.trim();
    if (password == confirmPassword && password.length >= 6) {
      _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) {
        print("Sign up user successful.");
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Sign up user successful.")));
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const MyHomePage()),
            ModalRoute.withName('/'));
      }).catchError((error) {
        print(error.message);
      });
    } else {
      print("Password and Confirm-password is not match.");
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Password and Confirm-password is not match.")));
    }
  }

  buildTextFieldEmail() {
    return Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.yellow[50], borderRadius: BorderRadius.circular(16)),
        child: TextField(
            controller: emailController,
            decoration: const InputDecoration.collapsed(hintText: "Email"),
            keyboardType: TextInputType.emailAddress,
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

  buildTextFieldPasswordConfirm() {
    return Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(top: 12),
        decoration: BoxDecoration(
            color: Colors.yellow[50], borderRadius: BorderRadius.circular(16)),
        child: TextField(
            controller: confirmController,
            obscureText: true,
            decoration:
                const InputDecoration.collapsed(hintText: "Re-password"),
            style: const TextStyle(fontSize: 18)));
  }
}

class HeadRightClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    final path = Path();

    path.moveTo(0, 0);
    path.lineTo(0, h * 0.13);
    path.lineTo(w * 0.03, h * 0.09);
    path.quadraticBezierTo(
        w * 0.2, h * -0.01, w * 0.4, h * 0.7);
    path.cubicTo(w * 0.45, h * 0.85, w * 0.6, h * 0.85,
        w * 0.75, h * 0.8);
    path.quadraticBezierTo(w * 0.9, h * 0.75, w, h * 0.6);
    path.lineTo(w, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class HeadClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    final path = Path();
    path.lineTo(0, 50);
    path.quadraticBezierTo(w * 0.2, h * 0.7, w * 0.5, h * 0.6);
    path.quadraticBezierTo(w * 0.75, h * 0.5, w, h);
    path.lineTo(w, h);
    path.lineTo(w, 0);

    //path.quadraticBezierTo(w * 0.5, h - 100, w, h - 100);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
