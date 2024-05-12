import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_constants.dart';
import '../../utils/loading_idicator_dialog.dart';
import '../../utils/network.dart';
import '../../utils/preferences_manager.dart';
import '../../utils/variables.dart';
import '../main_screen.dart';

class UpdatePasswordScreen extends StatefulWidget {
  @override
  _UpdatePasswordScreenState createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  TextEditingController _oldPasswordController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Renew password'),
        backgroundColor: AppConstants.primaryColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _oldPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Old password',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _newPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'New password',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                setState(() {
                  // Show loading state
                });
                await _confirm();
                setState(() {
                  // Reset loading state
                });
              },
              child: Text('Validate'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: AppConstants.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _confirm() async {
    LoadingIndicatorDialog().show(context);
    var data = {
      "old": _oldPasswordController.text,
      "new": _newPasswordController.text
    };
    try {
      var res = await Network().addData(data, Variables.UPDATE_PASSWORD);
      LoadingIndicatorDialog().dismiss();
      var body = json.decode(res.body);
      print("body: " + body.toString());
      if (200 == res.statusCode && body.toString() == "Success") {
        PreferencesManager.setPassword(data['new']!);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(body.toString()),
        ));
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MainScreen(selectedIndex: 3),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("login-msg".tr + ", " + body.toString()),
        ));
      }
    } catch (e) {
      LoadingIndicatorDialog().dismiss();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("login-msg-catch".tr + ", " + e.toString()),
      ));
      return null;
    }
  }
}
