import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hotnot/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AlertDialogueBoxCustom {
  alertDialogueBoxCustomForLogout(BuildContext context) async {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('LOGOUT',
            style: TextStyle(color: Colors.black, fontFamily: 'Poppins')),
        content: const Text('Are you sure you want to log out',
            style: TextStyle(color: Colors.black, fontFamily: 'Poppins')),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel',
                style: TextStyle(color: Colors.black, fontFamily: 'Poppins')),
          ),
          TextButton(
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.clear();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => loginScreen()),
                  (route) => false);
            },
            child: const Text('Logout',
                style: TextStyle(color: Colors.black, fontFamily: 'Poppins')),
          ),
        ],
      ),
    );
  }

  alertDialogueBoxCustomForExit(BuildContext context) async {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('EXIT'),
        content: const Text('Are you sure you want to Exit',
            style: TextStyle(color: Colors.black, fontFamily: 'Poppins')),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel',
                style: TextStyle(color: Colors.black, fontFamily: 'Poppins')),
          ),
          TextButton(
            onPressed: () {
              SystemNavigator.pop();
            },
            child: const Text('Exit',
                style: TextStyle(color: Colors.black, fontFamily: 'Poppins')),
          ),
        ],
      ),
    );
  }
}
