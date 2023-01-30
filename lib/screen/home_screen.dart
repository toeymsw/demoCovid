import 'dart:convert';

import 'package:codeproj/model/card_covid.dart';
import 'package:codeproj/model/covid_data.dart';
import 'package:codeproj/screen/login_screen.dart';
import 'package:codeproj/widget/detailcovid.dart';
import 'package:codeproj/widget/medical_card.dart';
import 'package:codeproj/widget/symptoms_card.dart';
import 'package:codeproj/widget/preventive_card.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  CovidData? payload;
  bool isLoading = true;
  List<CardCovid>? lstCovid = [];
  ////////////bottom navigator start with index 0 ('Home')
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    getcovidData();
  }

//// waiting API
  getcovidData() async {
    try {
      var response = await Dio().get(
          'https://static.easysunday.com/covid-19/getTodayCases.json?fbclid=IwAR2MttxJqqY-eVzi_y-c-7b2pmMzgk6sLrlsTMORrzqWpP1GRXERSO_xHfc');

      payload = CovidData.fromJson(response.data);
      lstCovid = [
        CardCovid(
            title: 'All Cases',
            subtitle: payload?.cases.toString(),
            color: Colors.orange.shade700),
        CardCovid(
            title: 'Today Cases',
            subtitle: payload?.todayCases.toString(),
            color: Colors.yellow.shade600),
        CardCovid(
            title: 'All Death',
            subtitle: payload?.deaths.toString(),
            color: Colors.red.shade800),
        CardCovid(
            title: 'Today Death',
            subtitle: payload?.todayDeaths.toString(),
            color: Colors.red.shade600),
        CardCovid(
            title: 'Recoverd',
            subtitle: payload?.recovered.toString(),
            color: Colors.green.shade600),
      ];

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> bottombar = <Widget>[
      ////////   index 0
      SafeArea(
          child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            DetailCovid(payload: lstCovid ?? []),
            PreventiveCard(),
          ],
        ),
      )),
      ///////   index 1
      SymptomsCard(),
      /////// index 2
      MedicalCard(),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text("Covid 19", style: TextStyle(color: Colors.green)),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.exit_to_app_outlined),
              color: Colors.green,
              onPressed: () {
                signOut(context);
              },
            )
          ]),

      /////////////////////////
      body: Center(
          child: isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : bottombar.elementAt(_selectedIndex)),
      // SingleChildScrollView(
      //     scrollDirection: Axis.vertical,
      //     child: isLoading
      //         ? const Center(child: CircularProgressIndicator())
      //         : Column(
      //             children: [
      //               DetailCovid(
      //                 payload: lstCovid ?? [],
      //               ),
      //               PreventiveCard(),
      //               MedicalCard(),
      //             ],
      //           )),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem> [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.local_hospital_outlined), label: 'Symptoms'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.call_outlined), label: 'Medical'),
      //   ],

      // currentIndex: _selectedIndex,
      // selectedItemColor: Colors.green.shade700,
      // onTap: _onItemTapped,),

      bottomNavigationBar: ConvexAppBar(
        items: const [
          TabItem(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            title: 'Home',
          ),
          TabItem(
              icon: Icon(
                Icons.local_hospital_outlined,
                color: Colors.white,
              ),
              title: 'Symptoms'),
          TabItem(
              icon: Icon(
                Icons.call_outlined,
                color: Colors.white,
              ),
              title: 'Medical'),
        ],
        activeColor: Colors.white30,
        style: TabStyle.reactCircle,
        height: 50,
        top: -17,
        curveSize: 80,
        backgroundColor: Colors.green.shade300,
        color: Colors.white,
        initialActiveIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

////////////   signout
  void signOut(BuildContext context) {
    _auth.signOut();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => MyLoginPage()),
        ModalRoute.withName('/'));
  }
}
