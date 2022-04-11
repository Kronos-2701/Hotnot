import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hotnot/DataModule/Screen/dataScreen.dart';
import 'package:hotnot/Utils/Cutom_TextStyle.dart';
import 'package:shared_preferences/shared_preferences.dart';

class loginScreen extends StatefulWidget {
  loginScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

String userEmail = "user@example.com";
String userPassword = "password123";

class _loginScreenState extends State<loginScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();

    return Scaffold(
      appBar: AppBar(
          elevation: 5,
          centerTitle: true,
          title: Text("Login",
              style: CustomTextStyle().boldHeading(25, Colors.white))),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView(
              shrinkWrap: true,
              children: [
                SizedBox(height: 20),
                TextField(
                  controller: email,
                  decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "Enter your  Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: password,
                  decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Enter your password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 100),
          ElevatedButton(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(25, 12, 25, 12),
                child: Text("Login",
                    style: CustomTextStyle().poppins400(15, Colors.white)),
              ),
              onPressed: () async {
                await checkCredentials(email, password)
                    ? Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => data_Screen(),
                        ))
                    : Fluttertoast.showToast(msg: "Invalid Credentials");
              }),
          const SizedBox(height: 160)
        ],
      ),
    );
  }
}

checkCredentials(
    TextEditingController email, TextEditingController password) async {
  if (email.text.toString() == userEmail &&
      password.text.toString() == userPassword) {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', userPassword);
    await prefs.setString('password', userEmail);
    return true;
  } else {
    return false;
  }
}
