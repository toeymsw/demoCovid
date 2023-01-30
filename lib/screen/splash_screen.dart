import 'package:codeproj/screen/home_screen.dart';
import 'package:codeproj/screen/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future checkAuth(BuildContext context) async {
    var user = await _auth.currentUser;
    if (user != null) {
      print("Already singed-in with");

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const MyHomePage()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MyLoginPage()));
    }
  }

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), (() {
      checkAuth(context);
    }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Container(
                color: Colors.white,
                child: Image.asset(
                  'assets/icons/new-normality.png',
                  height: 150,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
