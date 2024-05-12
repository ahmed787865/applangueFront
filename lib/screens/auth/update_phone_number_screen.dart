import 'dart:convert';
import '/screens/auth/verification_code_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_constants.dart';
import '../../utils/loading_idicator_dialog.dart';
import '../../utils/network.dart';
import '../../utils/preferences_manager.dart';
import '../../utils/variables.dart';

class UpdatePhoneNumberScreen extends StatefulWidget {
  @override
  _UpdatePhoneNumberScreenState createState() =>
      _UpdatePhoneNumberScreenState();
}

class _UpdatePhoneNumberScreenState extends State<UpdatePhoneNumberScreen> {
  TextEditingController _phoneNumberController = TextEditingController();
  bool _isValidPhoneNumber = false;

  void _validatePhoneNumber() {
    String phoneNumber = _phoneNumberController.text;
    bool isValid = _isValidPhoneNumberFormat(phoneNumber);

    setState(() {
      _isValidPhoneNumber = isValid;
    });
  }

  bool _isValidPhoneNumberFormat(String phoneNumber) {
    // Basic phone number validation using a regular expression
    RegExp regex = RegExp(r'^\d{10}$'); // Assumes a 10-digit phone number
    return regex.hasMatch(phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update phone number'),
        backgroundColor: AppConstants.primaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                controller: _phoneNumberController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Entre the new phone Number',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _getCode,
              child: Text('Validate'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: AppConstants.primaryColor,
              ),
            ),
            SizedBox(height: 16.0),
            _isValidPhoneNumber
                ? Text(
                    'Phone number is valid!',
                    style: TextStyle(color: Colors.green),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }

  _getCode() async {
    LoadingIndicatorDialog().show(context);
    var data = {"phone_number": _phoneNumberController.text};
    try {
      var res = await Network().addData(data, Variables.UPDATE_PHONE_NUMBER);
      LoadingIndicatorDialog().dismiss();
      var body = json.decode(res.body);
      print("body: " + body.toString());
      if (200 == res.statusCode && body.toString() == "Success") {
        PreferencesManager.setPhoneNumber(data['phone_number']!);
        Get.off(() => VerificationCodeScreen());
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("login-msg".tr + ", " + body.toString()),
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
}
