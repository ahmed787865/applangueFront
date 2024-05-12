import 'dart:convert';
import '/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/app_constants.dart';
import '../../utils/loading_idicator_dialog.dart';
import '../../utils/network.dart';
import '../../utils/preferences_manager.dart';
import '../../utils/variables.dart';

class RenewPasswordScreen extends StatefulWidget {
  @override
  _RenewPasswordScreenState createState() => _RenewPasswordScreenState();
}

class _RenewPasswordScreenState extends State<RenewPasswordScreen> {
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New password'),
        backgroundColor: AppConstants.primaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                controller: _passwordController,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  labelText: 'New password',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _reRenewPasswordScreen,
              child: Text('Validate'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: AppConstants.primaryColor,
              ),
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }

  _reRenewPasswordScreen() async {
    LoadingIndicatorDialog().show(context);
    String? phone_number = await PreferencesManager.getPhoneNumber();
    String? verificationCode = await PreferencesManager.getVerificationCode();
    var data = {
      "phone_number": phone_number,
      "password": _passwordController.text,
      "verification_code": verificationCode
    };
    try {
      var res = await Network().authData(data, Variables.RENEW_PASSWORD);
      LoadingIndicatorDialog().dismiss();
      var body = json.decode(res.body);
      print("body " + body.toString());
      if (200 == res.statusCode) {
        if (body.toString() == "true") {
          print("true");
          PreferencesManager.setPassword(data['password']!);

          _login(phone_number, data['password']);
          // Get.off(() => MainScreen());
        } else
          print("false");
      } else {
        print("false");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("login-msg".tr),
        ));
      }
    } catch (e) {
      LoadingIndicatorDialog().dismiss();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("login-msg-catch".tr + e.toString()),
      ));
      return null;
    }
  }

  _login(phone_number, password) async {
    print("login");
    // call login function
    var loginData = {
      "phone_number": phone_number,
      "password": password,
    };
    try {
      LoadingIndicatorDialog().show(context);
      var res = await Network().authData(loginData, Variables.LOGIN);
      LoadingIndicatorDialog().dismiss();
      var body = json.decode(res.body);
      if (200 == res.statusCode) {
        PreferencesManager.setAuthToken(body["token"]);
        PreferencesManager.setUserName(body["user_name"]);
        PreferencesManager.setUserType(body["user_type"]);
        PreferencesManager.setIsLoggedIn(true);

        Get.off(() => MainScreen());
      }
    } catch (e) {
      LoadingIndicatorDialog().dismiss();
      print("My error: " + e.toString());
      return null;
    }
  }
}
