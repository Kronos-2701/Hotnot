import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hotnot/DataModule/Screen/dataScreen.dart';
import 'package:hotnot/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash_Screen extends StatefulWidget {
  Splash_Screen({Key? key}) : super(key: key);

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  initState() {
    Timer(Duration(seconds: 2), () async {
      await isLoggedIn()
          ? Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => data_Screen(),
              ))
          : Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => loginScreen(),
              ));
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
              child: Image.asset("assets/welocme.png",
                  height: MediaQuery.of(context).size.height * 0.7,
                  width: MediaQuery.of(context).size.width * 0.7)),
          CircularProgressIndicator()
        ],
      ),
    ));
  }
}

isLoggedIn() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // String? userEmail = null;
  String? userEmail = await prefs.getString("email");
  if (userEmail == null) {
    return false;
  } else {
    return true;
  }
}
